//
//  Coin.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import Foundation
import SwiftUI

struct Coin: Identifiable {
    let id = UUID()
    let logo: String
    let title: String
    let price: String
    let change: String
    let changeColor: Color
}
