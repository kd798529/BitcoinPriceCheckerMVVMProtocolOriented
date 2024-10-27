//
//  Crypto.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 9/2/24.
//

import Foundation

struct Crypto: Codable {
    var BTC: Currency
    var LTC: Currency
    var XMR: Currency
    
   private enum CodingKeys: String, CodingKey {
        case BTC
        case LTC
        case XMR
    }
}
