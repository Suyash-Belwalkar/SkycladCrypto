//
//  ChartView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    let animateBars: Bool
    let animateLine: Bool
    
    @State private var selectedBar: String? = nil
    @State private var selectedValue: Double? = nil
    @State private var animateProgress: CGFloat = 0
    
    let barData: [ChartData] = [
        .init(category: "24 March", value: 120000),
        .init(category: "25 March", value: 95000),
        .init(category: "26 March", value: 135000),
        .init(category: "27 March", value: 110000),
        .init(category: "28 March", value: 75000),
        .init(category: "29 March", value: 142000),
        .init(category: "30 March", value: 101000)
    ]

    let lineData: [ChartData] = [
        .init(category: "24 March", value: 45000),
        .init(category: "25 March", value: 67000),
        .init(category: "26 March", value: 120000),
        .init(category: "27 March", value: 88000),
        .init(category: "28 March", value: 72000),
        .init(category: "29 March", value: 140000),
        .init(category: "30 March", value: 96000)
    ]

    var body: some View {
        VStack {
            Chart {
                ForEach(barData) { data in
                    BarMark(
                        x: .value("Category", data.category),
                        y: .value("Value", animateBars ? data.value : 0),
                        width: .fixed(44)
                    )
                    .foregroundStyle(
                        LinearGradient(colors: [.gray,.black], startPoint: .top, endPoint: .bottom)
                    )
                    .opacity(selectedBar == nil || selectedBar == data.category ? 0.3 : 0.15)
                    .cornerRadius(8)
                }
                         
                ForEach(lineData) { data in
                    LineMark(
                        x: .value("Category", data.category),
                        y: .value("Value", data.value)
                    )
                    .foregroundStyle(.green)
                    .opacity(0.8)
                    .interpolationMethod(.catmullRom)
                }
                                
                if let selectedBar = selectedBar,
                   let selectedData = barData.first(where: { $0.category == selectedBar }) {

                    RuleMark(x: .value("Selected", selectedBar))
                        .foregroundStyle(.white)
                        .lineStyle(StrokeStyle(lineWidth: 2))

                    PointMark(
                        x: .value("Category", selectedBar),
                        y: .value("Value", selectedData.value)
                    )
                    .foregroundStyle(.white)
                    .symbol(Circle())
                    .symbolSize(100)
                }
            }
            .frame(height: 200)
            .mask(
                    GeometryReader { geo in
                        Rectangle()
                            .frame(width: geo.size.width * animateProgress)
                    }
                )
                .padding()
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
                .onAppear {
                    animateProgress = 0
                    withAnimation(.easeOut(duration: 2)) {
                        animateProgress = 1
                    }
                }
            .onTapGesture { location in
                handleTap(at: location)
            }
            .overlay(alignment: .top) {
                if let selectedBar = selectedBar,
                   let selectedData = barData.first(where: { $0.category == selectedBar }) {
                    
                    VStack(spacing: 4) {
                        Text("₹\(selectedData.value, specifier: "%.0f")")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("\(selectedBar)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.black.opacity(0.8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                    )
                    .offset(y: -10)
                    .animation(.spring(response: 0.3), value: selectedBar)
                }
            }
        }
    }
    
    private func handleTap(at location: CGPoint) {
        let chartWidth: CGFloat = UIScreen.main.bounds.width - 32
        let barSpacing = chartWidth / CGFloat(barData.count)
        let tappedIndex = Int(location.x / barSpacing)
        
        if tappedIndex >= 0 && tappedIndex < barData.count {
            let tappedBar = barData[tappedIndex]
            
            if selectedBar == tappedBar.category {
                selectedBar = nil
                selectedValue = nil
            } else {
                selectedBar = tappedBar.category
                selectedValue = tappedBar.value
                
                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                impactFeedback.impactOccurred()
            }
        }
    }
}

struct ChartData: Identifiable {
    let id = UUID()
    let category: String
    let value: Double
}
