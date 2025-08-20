//
//  SwapView.swift
//  SkycladCrypto
//
//  Created by Suyash on 20/08/25.
//

import SwiftUI

struct SwapView: View {
    
   
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 15){
                ZStack{
                    SwapViewCard()
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 52, height: 52)
                        .cornerRadius(12)
                    
                    Rectangle()
                        .fill(.black.opacity(0.5))
                        .frame(width: 36, height: 36)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 1)
                        )
                    
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundStyle(.white)
                        .frame(width: 20 , height: 20)
                }
                
                Button{
                    //exchanges coins
                }label: {
                    Text("Exchange")
                        .fontDesign(.monospaced)
                        .foregroundStyle(.white)
                        .frame(width: 380, height: 60)
                        .background(.blue)
                        .cornerRadius(30)
                }
                .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text("Rate")
                        Text("Spread")
                        Text("Gas")
                        Text("You will receive")
                    }
                    .foregroundStyle(.gray)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 10){
                        Text("1 ETH = $1,32,465.80")
                        Text("0.2%")
                        Text("$422.73")
                        Text("$2,35,678")
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .foregroundStyle(.white)
                }
                .padding()
            }
            
            Blur()
        }
    }
}

#Preview {
    SwapView()
}
