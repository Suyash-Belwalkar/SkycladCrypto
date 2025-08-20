//
//  RecordsView.swift
//  SkycladCrypto
//
//  Created by Suyash on 18/08/25.
//

import SwiftUI

struct RecordsView: View {
    var body: some View {
        ZStack{
          Color.black.ignoresSafeArea()
            
            VStack(spacing: 12) {
                Image(systemName: "list.bullet")
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
                
                Text("Records will be shown here")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("(Out of scope of Deliverables)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

#Preview {
    RecordsView()
}
