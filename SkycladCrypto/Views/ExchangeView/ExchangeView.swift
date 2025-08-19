//
//  ExchangeView.swift
//  SkycladCrypto
//
//  Created by Suyash on 18/08/25.
//

import SwiftUI

struct ExchangeView: View {
    
    let transactions = [
        Transaction(logo: "btcLogo",transactionType: "Receive", title: "BTC", price: "+0.0015",date: "22 March"),
        Transaction(logo: "ethLogo",transactionType: "Sent", title: "ETH", price: "-0.0025",date: "28 March"),
        Transaction(logo: "btcLogo",transactionType: "Sent", title: "BTC", price: "-0.0030",date: "29 March"),
        Transaction(logo: "inrLogo",transactionType: "Receive", title: "BTC", price: "+30000",date: "30 March"),
        Transaction(logo: "btcLogo",transactionType: "Receive", title: "BTC", price: "+0.0115",date: "31 March"),
        Transaction(logo: "ethLogo",transactionType: "Receive", title: "BTC", price: "+0.0200",date: "2 April"),
       ]
    
    var body: some View {
        NavigationStack{
            ZStack {
                ScrollView(.vertical){
                    VStack{
                        TopBarView()
                            .frame(height: 30)
                            .padding(.top,50)
                        
                        BalanceCardView()
                        
                        ButtonsGroup()
                        
                        HStack{
                            Text("Transactions")
                                .foregroundStyle(.white)
                                .fontDesign(.monospaced)
                            
                            Spacer()
                            
                            Text("Last 4 days")
                                .foregroundStyle(.white)
                                .fontDesign(.monospaced)
                        }
                        .padding()
                        
                        
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
}

#Preview {
    ExchangeView()
}
