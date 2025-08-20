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
    
    let barData: [ChartData] = [
        .init(category: "A", value: 10),
        .init(category: "B", value: 15),
        .init(category: "C", value: 12),
        .init(category: "D", value: 14),
        .init(category: "E", value: 13),
        .init(category: "F", value: 17),
        .init(category: "G", value: 18)
    ]

    let lineData: [ChartData] = [
        .init(category: "A", value: 2),
        .init(category: "B", value: 7),
        .init(category: "C", value: 10),
        .init(category: "D", value: 12),
        .init(category: "E", value: 11),
        .init(category: "F", value: 12),
        .init(category: "G", value: 15)
    ]

    var body: some View {
        VStack {
            Chart {
                // Bar marks
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
                
                // Line marks
                ForEach(lineData) { data in
                    LineMark(
                        x: .value("Category", data.category),
                        y: .value("Value", data.value)
                    )
                    .foregroundStyle(.green)
                    .opacity(0.8)
                    .interpolationMethod(.catmullRom)
                }
                
                // Selection indicator line and circle for bars only
                if let selectedBar = selectedBar,
                   let selectedData = barData.first(where: { $0.category == selectedBar }) {
                    
                    // White vertical line
                    RuleMark(x: .value("Selected", selectedBar))
                        .foregroundStyle(.white)
                        .lineStyle(StrokeStyle(lineWidth: 2))
                    
                    // Circle at the top of selected bar
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
                        .frame(width: animateLine ? geo.size.width : 0)
                        .animation(.easeOut(duration: 2), value: animateLine)
                }
            )
            .padding()
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .onTapGesture { location in
                handleTap(at: location)
            }
            .overlay(alignment: .top) {
                // Value annotation
                if let selectedBar = selectedBar,
                   let selectedData = barData.first(where: { $0.category == selectedBar }) {
                    
                    VStack(spacing: 4) {
                        Text("\(selectedData.value, specifier: "%.0f")")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Category \(selectedBar)")
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
        // Calculate which bar was tapped based on location
        let chartWidth: CGFloat = UIScreen.main.bounds.width - 32 // Accounting for padding
        let barSpacing = chartWidth / CGFloat(barData.count)
        let tappedIndex = Int(location.x / barSpacing)
        
        if tappedIndex >= 0 && tappedIndex < barData.count {
            let tappedBar = barData[tappedIndex]
            
            // Toggle selection
            if selectedBar == tappedBar.category {
                selectedBar = nil
                selectedValue = nil
            } else {
                selectedBar = tappedBar.category
                selectedValue = tappedBar.value
                
                // Add haptic feedback
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
