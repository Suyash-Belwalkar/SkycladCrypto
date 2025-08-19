//
//  ChartView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI
import Charts

struct ChartView: View {
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
        Chart {
            // Bar Marks with low opacity
            ForEach(barData) { data in
                BarMark(
                    x: .value("Category", data.category),
                    y: .value("Value", data.value)
                )
                .foregroundStyle(.gray) // Example color
                .opacity(0.3) // Low opacity for bars
                .cornerRadius(8)
            }
            

            // Line Marks with higher opacity
            ForEach(lineData) { data in
                LineMark(
                    x: .value("Category", data.category),
                    y: .value("Value", data.value)
                )
                .foregroundStyle(.green) // Example color
                .opacity(0.8) // Higher opacity for lines
                .interpolationMethod(.catmullRom)
            }
        }
        .padding()
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        
    }
}

struct ChartData: Identifiable {
    let id = UUID()
    let category: String
    let value: Double
}


#Preview {
    ChartView()
}
