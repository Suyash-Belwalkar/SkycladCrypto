//
//  DashBoardView.swift
//  SkycladCrypto
//
//  Created by Suyash on 18/08/25.
//

import SwiftUI

struct DashBoardView: View {
    var body: some View {
        ZStack {
            Color.black
            VStack{
                ZStack{
                    Image("dashboardBackground")
                        .resizable()
                        .frame(width: 380 , height: 300)
                        .cornerRadius(20)
                    
                    
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DashBoardView()
}
