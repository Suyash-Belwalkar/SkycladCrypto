//
//  Blur.swift
//  SkycladCrypto
//
//  Created by Suyash on 20/08/25.
//

import SwiftUI

struct Blur: View {
    var body: some View {
        VStack {
                    Spacer()
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [Color.clear, Color.purple.opacity(0.4)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(height: 120)
                        .blur(radius: 25)
                        .allowsHitTesting(false)
                }
        .ignoresSafeArea()
    }
}

#Preview {
    Blur()
}
