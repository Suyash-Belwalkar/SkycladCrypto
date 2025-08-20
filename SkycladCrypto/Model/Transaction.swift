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
    let transactionType : String
    let title: String
    let price: String     
    let date: String
}
