//
//  TopBarView.swift
//  SkycladCrypto
//
//  Created by Suyash on 20/08/25.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
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
    }
}

#Preview {
    TopBarView()
}
