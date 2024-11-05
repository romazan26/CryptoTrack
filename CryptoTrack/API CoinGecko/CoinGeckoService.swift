//
//  CoinGeckoService.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import Foundation

final class CoinGeckoService {
    private let baseURL = "https://api.coingecko.com/api/v3/coins/markets"
    private let vsCurrency = "usd"
    private let order = "market_cap_desc"
    private let perPage = 100
    private let page = 1
    private let sparkline = "false"
    
    func fetchCoins(completion: @escaping (Result<[CryptoCoin], Error>) -> Void) {
        // Создаем URL с параметрами
        var urlComponents = URLComponents(string: baseURL)!
        urlComponents.queryItems = [
            URLQueryItem(name: "vs_currency", value: vsCurrency),
            URLQueryItem(name: "order", value: order),
            URLQueryItem(name: "per_page", value: String(perPage)),
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "sparkline", value: sparkline)
            ]
        guard let url = urlComponents.url else {
            print("Ошибка создания URL")
            return }
        
        // Запрос данных
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                completion(.failure(error))
            }
            
            guard let data = data else {
                print("Ошибка: данные отсутствуют")
                return
            }
            
            // Декодируем данные JSON в массив `CryptoCoin`
            do{
                let coins = try JSONDecoder().decode([CryptoCoin].self, from: data)
                completion(.success(coins))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
}
