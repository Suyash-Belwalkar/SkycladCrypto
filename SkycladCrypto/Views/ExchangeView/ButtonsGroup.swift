//
//  ButtonsGroup.swift
//  SkycladCrypto
//
//  Created by Suyash on 20/08/25.
//

import SwiftUI

struct ButtonsGroup: View {
    var body: some View {
        HStack{
            Button{
               print("hii")
            }label: {
                Image( systemName: "arrow.up")
                    .foregroundStyle(.gray)
                    .font(.title)
                
            }
            .frame(width:70, height: 70)
            .background(.black)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            
            NavigationLink(destination: SwapView()){
                Image( systemName: "plus")
                    .foregroundStyle(.gray)
                    .font(.title)
                
            }
            .frame(width:70, height: 70)
            .background(.black)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            
            Button{
                //sheet present
            }label: {
                Image( systemName: "arrow.down")
                    .foregroundStyle(.gray)
                    .font(.title)
                
            }
            .frame(width:70, height: 70)
            .background(.black)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            
        }.padding()
    }
        
}

#Preview {
    ButtonsGroup()
}
