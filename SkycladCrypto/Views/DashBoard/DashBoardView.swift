//
//  DashBoardView.swift
//  SkycladCrypto
//
//  Created by Suyash on 18/08/25.
//

import SwiftUI

struct DashBoardView: View {
    
    @State private var currency : String = "USD"
    
    let coins = [
           Coin(logo: "btcLogo", title: "Bitcoin (BTC)", price: "₹ 75,62,502.14", change: "+3.2%", changeColor: .green),
           Coin(logo: "ethLogo", title: "Ethereum (ETH)", price: "₹ 4,98,123.45", change: "-1.1%", changeColor: .red)
       ]
    
    var body: some View {
        ZStack {
            Color(hex: "#08080a")
            
            ScrollView(.vertical){
                VStack{
                    HeaderView()
                    
                    ContentView2()
                        .padding(.leading)
                    
                    ChartView()
                        .frame(height: 200)
                        .padding(.top, 40)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 15){
                            ForEach(coins) { coin in
                                CardView(
                                    logo: coin.logo,
                                    title: coin.title,
                                    price: coin.price,
                                    change: coin.change,
                                    changeColor: coin.changeColor
                                )
                            }
                        }
                        .padding(.leading)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DashBoardView()
}
