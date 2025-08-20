//
//  SwapViewCard.swift
//  SkycladCrypto
//
//  Created by Suyash on 20/08/25.
//

import SwiftUI

struct SwapViewCard: View {
    
    @State private var selectedCurrencySend = "ETH"
    @State private var selectedCurrencyRecieve = "INR"
    let currency = ["USD","ETH","BTC","INR"]
    
    var body: some View {
        VStack{
            ZStack{
                UnevenRoundedRectangle(
                    topLeadingRadius: 24,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 24
                )
                .fill(Color(hex:"#151517"))
                .frame(width: 361, height: 195)

                VStack(alignment: .leading, spacing: 15){
                    HStack{
                        Image("ethLogo")
                            .resizable()
                            .frame(width: 42, height: 42)
                        
                        Picker("Select a Currency", selection: $selectedCurrencySend) {
                            ForEach(currency, id: \.self) { currency in
                                Text(currency).tag(currency)
                                
                            }
                        }
                        .frame(width: 95)
                        .clipped()
                        
                        Spacer()
                        
                        Text("Send")
                            .fontDesign(.monospaced)
                            .foregroundStyle(.white)
                            .padding(.trailing)
                    }
                    .padding(.leading)
                    
                    Text("2.640")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.leading)
                    
                    HStack{
                        Text("Balance")
                            .font(.system(size: 15, design: .monospaced))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                        Spacer()
                        
                        Text("10.26")
                            .font(.system(size: 15))
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                        
                    }
                    .padding(.top)
                }
            }
            .frame(width:360)
            
            ZStack{
                    UnevenRoundedRectangle(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 24,
                        bottomTrailingRadius: 24,
                        topTrailingRadius: 0
                    )
                    .fill(Color(hex:"#151517"))
                    .frame(width: 361, height: 195)
                    
                VStack(alignment: .leading, spacing: 15){
                    HStack{
                        Image("inrLogo")
                            .resizable()
                            .frame(width: 42, height: 42)
                        
                        Picker("Select a Currency", selection: $selectedCurrencyRecieve) {
                            ForEach(currency, id: \.self) { currency in
                                Text(currency).tag(currency)
                                    
                            }
                        }
                        .frame(width: 95)
                        .clipped()
                        
                        Spacer()
                        
                        Text("Receive")
                            .fontDesign(.monospaced)
                            .foregroundStyle(.white)
                            .padding(.trailing)
                    }
                    .padding(.leading)
                    
                    Text("\u{20B9} 12,34,600")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.leading)
                    
                    HStack{
                        Text("Balance")
                            .font(.system(size: 15, design: .monospaced))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                        Spacer()
                        
                        Text("\u{20B9}15,40,800")
                            .font(.system(size: 15))
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                        
                    }
                    .padding(.top)
                }
            }
            .frame(width:360)
            
            
            
        }
    }
}

#Preview {
    SwapViewCard()
}
