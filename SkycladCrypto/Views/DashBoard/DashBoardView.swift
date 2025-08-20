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
           Coin(logo: "BTC", title: "Bitcoin (BTC)", price: "₹ 75,62,502.14", change: "+3.2%", changeColor: .green),
           Coin(logo: "ETH", title: "Ethereum (ETH)", price: "₹ 4,98,123.45", change: "-1.1%", changeColor: .red)
       ]
    
    let transactions = [
        Transaction(logo: "BTC",transactionType: "Receive", title: "BTC", price: "+0.0015",date: "22 March"),
        Transaction(logo: "ETH",transactionType: "Sent", title: "ETH", price: "-0.0025",date: "28 March"),
        Transaction(logo: "BTC",transactionType: "Sent", title: "BTC", price: "-0.0030",date: "29 March"),
        Transaction(logo: "INR",transactionType: "Receive", title: "INR", price: "+30000",date: "30 March"),
        Transaction(logo: "BTC",transactionType: "Receive", title: "BTC", price: "+0.0115",date: "31 March"),
        Transaction(logo: "ETH",transactionType: "Receive", title: "BTC", price: "+0.0200",date: "2 April"),
       ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(.vertical){
                VStack(spacing: 20){
                    HeaderView()
                    
                    ContentView2()
                        .frame(maxWidth: .infinity , idealHeight: 38)
                        .padding(.horizontal, 20)
                        
                    
                    ChartView(animateBars: animateBars, animateLine: animateLine)
                        .frame(maxWidth: .infinity , idealHeight: 215)
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
                        HStack(spacing: 20){
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
                    .scrollIndicators(.hidden)
                    
                    HStack{
                        Text("Recent Transactions")
                            .font(.system(size: 14, design:.monospaced))
                            .foregroundStyle(.white)
                            .padding(.top)
                            .padding(.leading)
                        Spacer()
                    }
                
                        LazyVStack(spacing: 8){
                            ForEach(transactions) { transaction in
                                TransactionsView(logo: transaction.logo, transactionType: transaction.transactionType, title: transaction.title, price: transaction.price, date: transaction.date)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top)
                        .padding(.bottom, 80)
                }
            }
            .scrollIndicators(.hidden)
            
          Blur()
        }
    }
}

#Preview {
    DashBoardView()
}
