//
//  LandingViewModel.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 10/19/24.
//

protocol LandingViewModelOutput: AnyObject {
    func updateView(BTC: Currency, LTC: Currency, XMR: Currency)
}

class LandingViewModel {
    
    weak var output: LandingViewModelOutput?
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    
    func getCryptoList()  {
        Task { 
            let cryptoList = try await networkService.getCryptoList()
            print(cryptoList)
            self.output?.updateView(BTC: cryptoList.BTC, LTC: cryptoList.LTC, XMR: cryptoList.XMR)
        }
    }
}
