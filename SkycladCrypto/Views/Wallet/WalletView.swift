//
//  WalletView.swift
//  SkycladCrypto
//
//  Created by Suyash on 18/08/25.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(spacing: 12) {
                Image(systemName: "wallet.bifold")
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
                
                Text("Wallet details will be shown here")
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
    WalletView()
}
