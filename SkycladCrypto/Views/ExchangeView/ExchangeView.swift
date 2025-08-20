//
//  ExchangeView.swift
//  SkycladCrypto
//
//  Created by Suyash on 18/08/25.
//

import SwiftUI

struct ExchangeView: View {
    
    let transactions = [
        Transaction(logo: "BTC",transactionType: "Receive", title: "BTC", price: "+0.0015",date: "22 March"),
        Transaction(logo: "ETH",transactionType: "Sent", title: "ETH", price: "-0.0025",date: "28 March"),
        Transaction(logo: "BTC",transactionType: "Sent", title: "BTC", price: "-0.0030",date: "29 March"),
        Transaction(logo: "INR",transactionType: "Receive", title: "BTC", price: "+\u{20B9}30000",date: "30 March"),
        Transaction(logo: "BTC",transactionType: "Receive", title: "BTC", price: "+0.0115",date: "31 March"),
        Transaction(logo: "ETH",transactionType: "Receive", title: "BTC", price: "+0.0200",date: "2 April"),
       ]
    
    var body: some View {
        NavigationStack{
            ZStack {
                ScrollView(.vertical){
                    VStack(spacing: 20){
                        TopBarView()
                            .frame(height: 30)
                            .padding(.top,50)
                        
                        BalanceCardView()
                            .padding(.bottom)
                            
                        
                        ButtonsGroup()
                        
                        HStack{
                            Text("Transactions")
                                .font(.system(size: 14, design: .monospaced))
                                .foregroundStyle(.white)
                            Spacer()
                            
                            Text("Last 4 days")
                                .font(.system(size: 14, design: .monospaced))
                                .foregroundStyle(.white)
                        }
                        
                        
                        
                      
                            VStack(spacing: 15){
                                ForEach(transactions) { transaction in
                                    TransactionsView(logo: transaction.logo, transactionType: transaction.transactionType, title: transaction.title, price: transaction.price, date: transaction.date)
                                }
                            }
                        
                        .padding()
                        .padding(.bottom, 80)
                    }
                    
                }
                .scrollIndicators(.hidden)
                
                Blur()
            }
        }
    }
}

#Preview {
    ExchangeView()
}
