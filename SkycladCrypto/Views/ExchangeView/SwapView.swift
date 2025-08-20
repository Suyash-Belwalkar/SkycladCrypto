//
//  SwapView.swift
//  SkycladCrypto
//
//  Created by Suyash on 20/08/25.
//

import SwiftUI

struct SwapView: View {
    
   
    var body: some View {
        VStack(spacing: 15){
            ZStack{
                SwapViewCard()
                
                            Rectangle()
                                .fill(.black)
                                .frame(width: 70, height: 70)
                                .cornerRadius(15)
                
                            Rectangle()
                                .fill(.black.opacity(0.5))
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                
                            Image(systemName: "arrow.up.arrow.down")
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
            }
            .padding()
        }
    }
}

#Preview {
    SwapView()
}
