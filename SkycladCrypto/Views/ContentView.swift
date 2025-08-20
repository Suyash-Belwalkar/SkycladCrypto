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
    @Environment(\.colorScheme) var colorScheme
    
    let tabItems = [
        (icon: "chart.line.uptrend.xyaxis", title: "Analytics"),
        (icon: "arrow.trianglehead.2.clockwise.rotate.90", title: "Exchange"),
        (icon: "list.bullet", title: "Record"),
        (icon: "wallet.bifold", title: "Wallet")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack {
                Group {
                    switch selectedTab {
                    case 0: DashBoardView()
                    case 1: ExchangeView()
                    case 2: RecordsView()
                    case 3: WalletView()
                    default: DashBoardView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.ignoresSafeArea())
                
                VStack {
                    Spacer()
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.black.opacity(0.5))
                            .frame(height: 100)
                            .blur(radius: 8)
                            .padding(.bottom)
                        
                        HStack(spacing: 0) {
                            ZStack {
                                HStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(   colorScheme == .dark ?
                                                 Color(hex: "#16181c") :
                                                    Color(hex: "#89888f")
                                        )
                                        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 5)
                                }
                                .frame(width:.infinity, height: 63)
                                
                                HStack(spacing: 0) {
                                    ForEach(0..<tabItems.count, id: \.self) { index in
                                        Capsule()
                                            .fill(selectedTab == index ? Color(hex: "#0c15b3") : Color.clear)
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
                                                    .frame(width: 24)
                                                    .foregroundColor(.white)
                                                
                                                Text(tabItems[index].title)
                                                    .font(.system(size: 10, weight: .medium))
                                                    .foregroundColor(.white)
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
                                        .frame(width: 62, height: 62)
                                        .background(
                                            Circle()
                                                .fill(Color.white)
                                        )
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 3)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
                
            }
        }
        
    }
    
}

#Preview{ ContentView() }
