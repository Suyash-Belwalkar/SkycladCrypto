//
//  Transaction.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import Foundation


struct Transaction: Identifiable {
    let id = UUID()
    let logo: String
    let transactionType : String// image name
    let title: String     // e.g., "Bitcoin (BTC)"
    let price: String     // e.g., "₹ 75,62,502.14"
    let date: String
}
