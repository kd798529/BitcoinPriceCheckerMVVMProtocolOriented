//
//  NetworkService.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 2/28/23.
//

import Foundation

protocol NetworkService {
    func getPrice(completion: @escaping (Result<Currency?, Error>) -> Void)
    func getCryptoList() async throws ->  Crypto
}

class APIManager: NetworkService {
    
    func getPrice(completion: @escaping (Result<Currency?, Error>) -> Void) {
        
        var currencyData: Currency?
        
        let urlString = "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                
                var result: Currency?
                do {
                    result = try JSONDecoder().decode(Currency.self, from: data)
                    completion(.success(result ?? nil))
                } catch {
                    completion(.failure(NSError()))
                }
                
                guard let final = result else {
                    return
                }
                print(final.USD)
                print(final.EUR)
                print(final.JPY)
                                
                currencyData?.USD = final.USD
                currencyData?.EUR = final.EUR
                currencyData?.JPY = final.JPY
            }
        }
        
        task.resume()
       
        
    }
    
    func getCryptoList() async throws ->  Crypto {
        
        let endpoint = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,LTC,XMR&tsyms=USD,EUR,JPY"
        
        guard let url = URL(string: endpoint) else {
            throw CryptoError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CryptoError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Crypto.self, from: data)
        } catch {
            throw CryptoError.invalidData
        }
        
    }
}
