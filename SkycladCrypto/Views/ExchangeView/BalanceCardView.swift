//
//  BalanceCardView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI

struct BalanceCardView: View {
    var body: some View {
        ZStack{
            Image("exchangeBackground")
                .resizable()
                .frame(width: 380, height: 190)
                .cornerRadius(25)
            VStack{
                Text("INR")
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 35)
                    .background(Color(hex:"#2727ab"))
                    .cornerRadius(10)
                    
                
                Text("1,35,469.05")
                    .foregroundStyle(.white)
                    .font(.system(size: 43, weight: .semibold))
                    
                
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

#Preview {
    BalanceCardView()
}
