//
//  ContentView.swift
//  SkycladCrypto
//
//  Created by Suyash on 18/08/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct ContentView: View {
    @State private var selectedTab = 0
    
    let tabItems = [
        (icon: "chart.line.uptrend.xyaxis", title: "Analytics"),
        (icon: "arrow.triangle.2.circlepath", title: "Exchange"),
        (icon: "book.pages", title: "Record"),
        (icon: "wallet.bifold", title: "Wallet")
    ]
    
    var body: some View {
        ZStack {
            VStack {
                Group {
                    switch selectedTab {
                    case 0: DashBoardView()
                    case 1: ExchangeView()
                    case 2: RecordsView()
                    case 3: WalletView()
                    default: DashBoardView()
                    }
                }
                
                Spacer()
                
                HStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color(hex: "#2C2C2E").opacity(0.8))
                            .frame(height: 65)
                        
                        HStack(spacing: 0) {
                            ForEach(0..<tabItems.count, id: \.self) { index in
                                Capsule()
                                    .fill(selectedTab == index ? Color(hex: "#3B82F6") : Color.clear)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 6)
                            }
                        }
                        
                        HStack(spacing: 0) {
                            ForEach(0..<tabItems.count, id: \.self) { index in
                                Button(action: {
                                    selectedTab = index
                                }) {
                                    VStack(spacing: 4) {
                                        Image(systemName: tabItems[index].icon)
                                            .font(.system(size: 20, weight: .medium))
                                            .foregroundColor(selectedTab == index ? .white : Color(hex: "#8E8E93"))
                                        
                                        Text(tabItems[index].title)
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(selectedTab == index ? .white : Color(hex: "#8E8E93"))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
    
                    if selectedTab == 0 {
                        Spacer()
                            .frame(width: 16)
                        Button(action: {
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(Color(hex: "#3B82F6"))
                                .frame(width: 50, height: 50)
                                .background(
                                    Circle()
                                        .fill(Color.white)
                                )
                                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
}
#Preview {
    ContentView()
}
