//
//  LoadingViewModel.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    let service = CoinGeckoService()
    
    @Published var coins: [CryptoCoin] = []
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        service.fetchCoins { result in
            switch result {
            case .success(let coins):
                self.coins = coins
            case .failure:
                break
            }
        }
    }
}
