//
//  CurrencyInfo.swift
//  SkycladCrypto
//
//  Created by Suyash on 21/08/25.
//


struct CurrencyInfo {
    let value: String
    let balance: String
}

let currencyData: [String: CurrencyInfo] = [
    "ETH": CurrencyInfo(value: "2.640", balance: "10.256"),
    "BTC": CurrencyInfo(value: "1.820", balance: "8.12"),
    "INR": CurrencyInfo(value: "4,65,006.4", balance: "4,35,804")
]
