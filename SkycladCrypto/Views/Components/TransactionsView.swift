//
//  TransactionsView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI

struct TransactionsView: View {
    let logo: String
    let transactionType: String
    let title: String    
    let price: String
    let date: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(logo)
                .interpolation(.none)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(transactionType)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .medium))
                
                Text(date)
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .regular))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .medium))
                
                Text(price)
                    .foregroundColor(price.hasPrefix("+") ? .green :
                                   price.hasPrefix("-") ? .red : .white)
                    .font(.system(size: 14, weight: .medium))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(hex: "#141414"))
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
        )
        .frame(maxWidth: .infinity)
        .frame(height: 88)
    }
}

#Preview {
    VStack(spacing: 12) {
        TransactionsView(
            logo: "BTC",
            transactionType: "Receive",
            title: "BTC",
            price: "+0.0015",
            date: "22 March"
        )
        
        TransactionsView(
            logo: "ETH",
            transactionType: "Send",
            title: "ETH",
            price: "-0.0025",
            date: "20 March"
        )
        
        TransactionsView(
            logo: "BTC",
            transactionType: "Receive",
            title: "BTC",
            price: "+0.0045",
            date: "18 March"
        )
    }
    .padding()
    .background(Color.black)
}
