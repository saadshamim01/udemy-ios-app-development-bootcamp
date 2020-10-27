//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    
    //Create the method stubs wihtout implementation in the protocol.
    //It's usually a good idea to also pass along a reference to the current class.
    //e.g. func didUpdatePrice(_ coinManager: CoinManager, price: String, currency: String)
    //Check the Clima module for more info on this.
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = "F446EE60-0FEE-4095-B35D-4D7D3E71B69E"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        
        let urlString = "\(baseURL)\(currency)/USD?apikey=\(apiKey)"
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    
                    if let bitcoinPrice = self.parseJSON(safeData){
                        
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        
                        
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                        
                    }
                    
                }
            }//End of task
            
            //Resume the task
            task.resume()
        }//End of url
        
    }//End of parseRequest
    
    
    
    func parseJSON(_ data: Data) -> Double?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(CoinData.self, from: data)
            
            //Get the last price
            let lastPrice = decodedData.rate
            return lastPrice
        }
        
        catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
}
