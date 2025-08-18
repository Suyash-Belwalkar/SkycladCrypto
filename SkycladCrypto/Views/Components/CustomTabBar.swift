//
//  CustomNavBar.swift
//  SkycladCrypto
//
//  Created by Suyash on 18/08/25.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case analytics = "chart.line.uptrend.xyaxis"
    case exchange = "arrow.trianglehead.2.counterclockwise.rotate.90"
    case record = "list.bullet"
    case wallet = "wallet.bifold"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                Button {
                    // Haptic feedback
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                    
                    selectedTab = tab
                } label: {
                    VStack {
                        Image(systemName: tab.rawValue)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(selectedTab == tab ? .white : .gray)
                            .padding(12)
                            .background(
                                ZStack {
                                    if selectedTab == tab {
                                        LinearGradient(
                                            colors: [Color.blue, Color.purple],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                        .clipShape(Capsule())
                                    }
                                }
                            )
                    }
                }
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .background(.ultraThinMaterial) // Glassmorphism
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .padding(.horizontal, 20)
        .shadow(radius: 5)
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.analytics))
}
