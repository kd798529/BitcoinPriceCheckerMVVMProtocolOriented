//
//  ErrorList.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 10/16/24.
//

enum CurrencyError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}


enum CryptoError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
