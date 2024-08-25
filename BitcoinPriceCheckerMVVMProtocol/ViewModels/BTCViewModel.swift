//
//  BTCViewModel.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 2/28/23.
//

import Foundation

protocol BTCViewModelOutput: AnyObject {
    func updateView(usdPrice: Double, eurPrice: Double, jpyPrice: Double)
}

class BTCViewModel {
    
    weak var output: BTCViewModelOutput?
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getPrice() {
         networkService.getPrice{ [weak self] result in
            switch result {
            case .success(let prices):
                self?.output?.updateView(usdPrice: prices?.USD ?? 0.00, eurPrice: prices?.EUR ?? 0.00, jpyPrice: prices?.JPY ?? 0.00)
            case .failure:
                self?.output?.updateView(usdPrice: 0.00, eurPrice: 0.00, jpyPrice: 0.00)
            }
        }
    }
}
