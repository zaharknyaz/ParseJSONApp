//
//  ViewController.swift
//  ParseJSONApp
//
//  Created by Захар Князев on 13.12.2022.
//

import UIKit

class CurrencyViewController: UIViewController {

    @IBAction func parseCurrenciesJSONAction(_ sender: Any) {
        fetchCurrency()
    }
    
}

// MARK: - Networking
extension CurrencyViewController {
    private func fetchCurrency() {
        guard let url = URL(string: "https://api.coinbase.com/v2/currencies") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let currency = try JSONDecoder().decode(CurrenciesInfo.self, from: data)
                print(currency)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
}
