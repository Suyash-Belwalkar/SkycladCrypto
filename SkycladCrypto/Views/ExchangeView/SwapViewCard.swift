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
    let currency = ["ETH","BTC","INR"]
    @State private var amount: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                UnevenRoundedRectangle(
                    topLeadingRadius: 24,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 24
                )
                .fill(Color(hex:"#151517"))
                .frame(width: 361, height: 195)

                VStack(alignment: .leading, spacing: 15) {
                    HStack(spacing: 12) {
                        Image(selectedCurrencySend)
                            .resizable()
                            .frame(width: 42, height: 42)
                            .padding(.leading)
                        
                        Menu {
                            ForEach(currency, id: \.self) { curr in
                                Button(curr) {
                                    selectedCurrencySend = curr
                                }
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Text(selectedCurrencySend)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(minWidth: 40, alignment: .leading)
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.clear)
                        }
                        
                        Spacer()
                        
                        Text("Send")
                            .fontDesign(.monospaced)
                            .foregroundStyle(.white)
                            .padding(.trailing)
                    }
                    
                    TextField("0", text: $amount)
                                .font(.system(size: 40, weight: .semibold))
                                .foregroundStyle(.white)
                                .keyboardType(.decimalPad) 
                                .multilineTextAlignment(.leading)
                                .padding(.leading)
                    
                    HStack {
                        Text("Balance")
                            .font(.system(size: 15, design: .monospaced))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                        Spacer()
                        
                        Text(currencyData[selectedCurrencySend]?.balance ?? "--")
                            .font(.system(size: 15))
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                    }
                    .padding(.top)
                }
            }
            .frame(width: 360)
            
            ZStack {
                UnevenRoundedRectangle(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 24,
                    bottomTrailingRadius: 24,
                    topTrailingRadius: 0
                )
                .fill(Color(hex:"#151517"))
                .frame(width: 361, height: 195)
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack(spacing: 12) {
                        Image(selectedCurrencyRecieve)
                            .resizable()
                            .frame(width: 42, height: 42)
                            .padding(.leading)
                        
                        Menu {
                            ForEach(currency, id: \.self) { curr in
                                Button(curr) {
                                    selectedCurrencyRecieve = curr
                                }
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Text(selectedCurrencyRecieve)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(minWidth: 40, alignment: .leading)
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.clear)
                        }
                        
                        Spacer()
                        
                        Text("Receive")
                            .font(.system(size: 14))
                            .fontDesign(.monospaced)
                            .foregroundStyle(.white)
                            .padding(.trailing)
                    }
                    
                    Text(currencyData[selectedCurrencyRecieve]?.value ?? "--")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.leading)
                    
                    HStack {
                        Text("Balance")
                            .font(.system(size: 15, design: .monospaced))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                        Spacer()
                        
                        Text(currencyData[selectedCurrencyRecieve]?.balance ?? "--")
                            .font(.system(size: 15))
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                    }
                    .padding(.top)
                }
            }
            .frame(width: 360)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SwapViewCard()
    }
}
