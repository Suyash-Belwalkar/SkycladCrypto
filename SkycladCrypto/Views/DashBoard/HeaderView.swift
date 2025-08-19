//
//  HeaderView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack{
            ZStack{
                Image("dashboardBackground")
                    .resizable()
                    .frame(width: 380 , height: 300)
                    .cornerRadius(20)
                 
                
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
                    .padding(.bottom, 100)
                    .padding(.leading)
                    .padding(.top, 40)
                        
                    
                    HStack{
                        Text("Portfolio Value >")
                            .foregroundStyle(.white)
                            .font(.system(size: 15, weight: .medium, design: .monospaced))
                            .padding(.leading, 30)
                        
                        Spacer()
                        
                        ContentView1()
                            .frame(width: 100 ,height: 40)
                            .padding(.trailing, 28)
                            
                    }
                    
                    Text("$ 134567")
                        .foregroundStyle(.white)
                        .padding(.leading, 30)
                        .font(.largeTitle)
                        .bold()
                }
                
                
                    
                
            }
            
            Spacer()
        }
    }
}

#Preview {
    HeaderView()
}
