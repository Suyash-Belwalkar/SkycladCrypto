//
//  DashBoardView.swift
//  SkycladCrypto
//
//  Created by Suyash on 18/08/25.
//

import SwiftUI

struct DashBoardView: View {
    
    @State private var currency : String = "USD"
    @State private var animateBars = false
    @State private var animateLine = false
    
    let coins = [
           Coin(logo: "btcLogo", title: "Bitcoin (BTC)", price: "₹ 75,62,502.14", change: "+3.2%", changeColor: .green),
           Coin(logo: "ethLogo", title: "Ethereum (ETH)", price: "₹ 4,98,123.45", change: "-1.1%", changeColor: .red)
       ]
    
    let transactions = [
        Transaction(logo: "btcLogo",transactionType: "Receive", title: "BTC", price: "+0.0015",date: "22 March"),
        Transaction(logo: "ethLogo",transactionType: "Sent", title: "ETH", price: "-0.0025",date: "28 March"),
        Transaction(logo: "btcLogo",transactionType: "Sent", title: "BTC", price: "-0.0030",date: "29 March"),
        Transaction(logo: "inrLogo",transactionType: "Receive", title: "INR", price: "+30000",date: "30 March"),
        Transaction(logo: "btcLogo",transactionType: "Receive", title: "BTC", price: "+0.0115",date: "31 March"),
        Transaction(logo: "ethLogo",transactionType: "Receive", title: "BTC", price: "+0.0200",date: "2 April"),
       ]
    
    var body: some View {
        ZStack {
            
            ScrollView(.vertical){
                VStack{
                    HeaderView()
                    
                    ContentView2()
                        .padding(.leading)
                    
                    ChartView(animateBars: animateBars, animateLine: animateLine)
                        .frame(height: 200)
                        .padding(.top, 40)
                        .onAppear {
                                withAnimation(.easeOut(duration: 0.8)) {
                                animateBars = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.easeInOut(duration: 1.2)) {
                                animateLine = true
                            }
                        }
                    }
                    
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
                    HStack{
                        Text("Recent Transactions")
                            .foregroundStyle(.white)
                            .fontDesign(.monospaced)
                            .padding(.top)
                            .padding(.leading)
                        Spacer()
                    }
                    
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 15){
                            ForEach(transactions) { transaction in
                                TransactionsView(logo: transaction.logo, transactionType: transaction.transactionType, title: transaction.title, price: transaction.price, date: transaction.date)
                            }
                        }
                    }
                    .padding()
                }
                
            }
        }
    }
}

#Preview {
    DashBoardView()
}
