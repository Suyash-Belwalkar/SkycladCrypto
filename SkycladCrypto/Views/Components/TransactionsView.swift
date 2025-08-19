//
//  TransactionsView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI

struct TransactionsView: View {
    let logo: String
    let transactionType : String// image name
    let title: String     // e.g., "Bitcoin (BTC)"
    let price: String     // e.g., "₹ 75,62,502.14"
    let date: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(hex: "#141414"))
                .frame(width: .infinity, height: 90)
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )

            HStack(spacing: 15) {
                
                Image(logo)
                    .interpolation(.none)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding(.leading, 10)
                    
                
                VStack(alignment: .leading){
                    Text(transactionType)
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .medium, design: .monospaced))
                        .padding(.top)
                        .padding(.bottom, 2)
                
                    Text(date)
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .semibold))
                        
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    
                    Text(title)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium, design: .monospaced))
                        .padding(.top)
                        .padding(.bottom, 2)
                        .padding(.trailing)
                       
                    
                    Text(price)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .padding(.trailing)
                       
                }
            }
            .padding(5)
        }
    }
}

#Preview{
    TransactionsView(logo: "btcLogo",transactionType: "Receive", title: "BTC", price: "+0.0015",date: "22 March")
}
