//
//  HeaderView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI

struct HeaderView: View {
    
    @State private var selectedCurrency: Segment = .inr
     private let inrBalance = "1,34,567"
     private let btcBalance = "2.45"
    
    var body: some View {
            ZStack{
                Image("dashboardBackground")
                    .resizable()
                    .frame(width: 375 , height: 239)
                    .cornerRadius(24)

                VStack(alignment: .leading){
                    HStack{
                        Button{
                            //sheet present
                        }label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.white)
                                .font(.title)
                                .padding(.leading)
                        }
                        
                        Spacer()
                        
                        Button{
                            //sheet present
                        }label: {
                            Image( systemName: "bell")
                                .foregroundStyle(.white)
                                .font(.title)
                                .padding(.trailing)
                        }
                        .padding(.trailing)
                    }
                    .padding(.bottom, 50)
                    .padding(.leading)
                    .padding(.top, 40)
                        
                    
                    HStack{
                        Text("Portfolio Value >")
                            .foregroundStyle(.white)
                            .font(.system(size: 15, weight: .medium, design: .monospaced))
                            .padding(.leading, 30)
                        
                        Spacer()
                        
                        ContentView1(selectedSegment2: $selectedCurrency)
                            .frame(width: 100 ,height: 38)
                            .padding(.trailing, 28)
                            
                    }
                    
                    Text(displayText)
                        .foregroundStyle(.white)
                        .padding(.leading, 30)
//                        .padding(.bottom, 50)
                        .font(.largeTitle)
                        .bold()
                }
                
                
                    
                
            }
            
           
        
    }
    private var displayText: String {
            switch selectedCurrency {
            case .inr:
                return "₹ \(inrBalance)"
            case .btc:
                return "₿ \(btcBalance)"
            }
        }
}

#Preview {
    HeaderView()
}
