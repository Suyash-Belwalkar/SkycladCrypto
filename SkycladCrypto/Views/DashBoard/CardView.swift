//
//  CardView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI

struct CardView: View {
    let logo: String
    let title: String
    let price: String
    let change: String
    let changeColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black)
                .frame(width: 204, height: 118)
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )

            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Image(logo)
                        .resizable()
                        .frame(width: 42, height: 42)

                    
                    Text(title)
                        .foregroundColor(.white)
                        .font(.system(size: 14, design: .monospaced))
                }
                
                HStack {
                    Text(price)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
//                        .padding(.leading)
                    
                    Text(change)
                        .foregroundColor(changeColor)
                        .font(.system(size: 12, weight: .semibold))
//                        .padding(.horizontal, 8)
//                        .padding(.vertical, 4)
                        .padding(.leading, 13)
                }
            }
            .padding(5)
        }
    }
}

#Preview{
    CardView(logo: "btcLogo", title: "Bitcoin (BTC)", price: "₹ 75,62,502.14", change: "+3.2%", changeColor: .green)
}

