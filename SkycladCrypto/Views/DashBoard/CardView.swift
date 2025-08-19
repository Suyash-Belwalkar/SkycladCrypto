//
//  CardView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI

struct CardView: View {
    let logo: String      // image name
    let title: String     // e.g., "Bitcoin (BTC)"
    let price: String     // e.g., "₹ 75,62,502.14"
    let change: String    // e.g., "+3.2%"
    let changeColor: Color // red or green depending on trend
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.black)
                .frame(width: 240, height: 130)
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )

            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Image(logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 50)
                        .padding(.leading, 10)
                    
                    Text(title)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium, design: .monospaced))
                        .padding(.leading)
                    
                    Spacer()
                }
                
                HStack {
                    Text(price)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Text(change)
                        .foregroundColor(changeColor)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .padding(.leading, 5)
                }
            }
            .padding(5)
        }
    }
}



