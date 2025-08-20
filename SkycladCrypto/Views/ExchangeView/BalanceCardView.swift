//
//  BalanceCardView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI

struct BalanceCardView: View {
    var body: some View {
        ZStack {
            ForEach(0..<3, id: \.self) { index in
                Image("backgroundStack")
                    .resizable()
                    .cornerRadius(24)
                    .frame(width: 361 - CGFloat(index * 8), height: 177)
                    .offset(x: CGFloat(index * 1), y: CGFloat(index * 9))
                    .opacity(1.0 - Double(index) * 0.1)
            }
            
            ZStack{
                Image("exchangeBackground")
                    .resizable()
                    .frame(width: 361, height: 177)
                    .cornerRadius(24)
                VStack{
                    Text("INR")
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 35)
                        .background(Color(hex:"#2727ab"))
                        .cornerRadius(10)
                    
                    
                    Text("1,35,469.05")
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .medium))
                    
                    
                    HStack{
                        Text("$ 1342")
                            .foregroundStyle(Color(hex:"#afa9c7"))
                            .padding(.trailing)
                        
                        Text("+4.5%")
                            .foregroundStyle(.green)
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    BalanceCardView()
}
