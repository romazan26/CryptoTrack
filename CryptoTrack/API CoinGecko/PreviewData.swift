//
//  PreviewData.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import Foundation

final class PreviewData{
    static let instance = PreviewData()
    init() {}
    func makePreviewCryptoCoin() -> CryptoCoin {
        return CryptoCoin(
            id: "bitcoin",
            symbol: "BTC",
            name: "Bitcoin",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png",
            currentPrice: 72184.84,
            marketCap: 1_430_000_000_000,
            marketCapRank: 1, fullyDilutedValuation: 1_500_000_000_000,
            totalVolume: 30_000_000_000,
            high24h: 73000.0,
            low24h: 71000.0,
            priceChange24h: -1700.0,
            priceChangePercentage24h: -2.35,
            marketCapChange24h: -3_000_000_000,
            marketCapChangePercentage24h: -0.2,
            circulatingSupply: 18_500_000,
            totalSupply: 21_000_000,
            maxSupply: 21_000_000,
            ath: 69000.0,
            athChangePercentage: -5.0,
            athDate: "2021-11-10T14:24:11.849Z",
            atl: 65.0,
            atlChangePercentage: 120000.0,
            atlDate: "2013-07-05T00:00:00.000Z",
            lastUpdated: "2023-10-10T14:24:11.849Z"
        )
    }

    func makePreviewCryptoCoins() -> [CryptoCoin] {
        return [
            CryptoCoin(id: "bitcoin", symbol: "BTC", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png", currentPrice: 72184.84, marketCap: 1_430_000_000_000, marketCapRank: 1, fullyDilutedValuation: 1_500_000_000_000, totalVolume: 30_000_000_000, high24h: 73000.0, low24h: 71000.0, priceChange24h: -1700.0, priceChangePercentage24h: -2.35, marketCapChange24h: -3_000_000_000, marketCapChangePercentage24h: -0.2, circulatingSupply: 18_500_000, totalSupply: 21_000_000, maxSupply: 21_000_000, ath: 69000.0, athChangePercentage: -5.0, athDate: "2021-11-10T14:24:11.849Z", atl: 65.0, atlChangePercentage: 120000.0, atlDate: "2013-07-05T00:00:00.000Z", lastUpdated: "2023-10-10T14:24:11.849Z"),
            CryptoCoin(id: "ethereum", symbol: "ETH", name: "Ethereum", image: "https://assets.coingecko.com/coins/images/279/large/ethereum.png", currentPrice: 2184.84, marketCap: 1_430_000_000_000, marketCapRank: 2, fullyDilutedValuation: 1_300_000_000_000, totalVolume: 20_000_000_000, high24h: 2200.0, low24h: 2150.0, priceChange24h: 35.0, priceChangePercentage24h: 2.35, marketCapChange24h: 2_500_000_000, marketCapChangePercentage24h: 0.18, circulatingSupply: 117_000_000, totalSupply: nil, maxSupply: nil, ath: 4800.0, athChangePercentage: -55.0, athDate: "2021-11-10T14:24:11.849Z", atl: 0.42, atlChangePercentage: 500000.0, atlDate: "2015-10-20T00:00:00.000Z", lastUpdated: "2023-10-10T14:24:11.849Z"),
            CryptoCoin(id: "tether", symbol: "USDT", name: "Tether", image: "https://assets.coingecko.com/coins/images/325/large/Tether-logo.png", currentPrice: 0.9991, marketCap: 1_430_000_000_000, marketCapRank: 3, fullyDilutedValuation: nil, totalVolume: 70_000_000_000, high24h: 1.001, low24h: 0.998, priceChange24h: -0.001, priceChangePercentage24h: 0.35, marketCapChange24h: 500_000_000, marketCapChangePercentage24h: 0.01, circulatingSupply: 70_000_000_000, totalSupply: 70_000_000_000, maxSupply: nil, ath: 1.1, athChangePercentage: -9.1, athDate: "2018-07-24T00:00:00.000Z", atl: 0.9, atlChangePercentage: 10.0, atlDate: "2015-03-02T00:00:00.000Z", lastUpdated: "2023-10-10T14:24:11.849Z")
        ]
    }
}
