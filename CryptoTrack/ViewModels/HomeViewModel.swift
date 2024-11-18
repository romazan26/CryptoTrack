//
//  LoadingViewModel.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI



final class HomeViewModel: ObservableObject {
    @Published var selectedVew = 1
    @Published var isPresentSetting: Bool = false
    
    //MARK: - Search propertyes
    @Published var searchCoins: String = ""
    @Published var isPresesntSearch: Bool = false
    @Published var compareCoins: CryptoCoin?
    
    //MARK: - Favorites propertyes
    @Published var isFavoritesOrLisrt: Bool = true
    @Published var favoriteCoins: Set<String> = [] {
        didSet{
            saveFavorites()
        }
    }
    
    //MARK: - Coins Properyes
    let service = CoinGeckoService()
    @Published var coins: [CryptoCoin] = []
    
    
    
    init() {
        getCoins()
        loadFavorites()
    }
    
    
    //MARK: - Search coin func
    func isSearching(coin: CryptoCoin) -> Bool {
        guard !searchCoins.isEmpty else {
            return true // Если строка поиска пустая, показываем все монеты
        }
        return coin.symbol.uppercased().contains(searchCoins.uppercased())
    }
    
    func isChoose(coin: CryptoCoin) -> Bool {
        compareCoins?.id == coin.id
    }
    
    //MARK: - Favorites coins func
    // Метод для добавления монеты в избранное
        func addFavorite(coin: CryptoCoin) {
            favoriteCoins.insert(coin.id)
        }
        
        // Метод для удаления монеты из избранного
        func removeFavorite(coin: CryptoCoin) {
            favoriteCoins.remove(coin.id)
        }
        
        // Проверка, является ли монета избранной
        func isFavorite(coin: CryptoCoin) -> Bool {
            favoriteCoins.contains(coin.id)
        }
        
        // Загрузка избранного из UserDefaults
        private func loadFavorites() {
            if let savedFavorites = UserDefaults.standard.array(forKey: "FavoriteCoins") as? [String] {
                favoriteCoins = Set(savedFavorites)
            }
        }
        
        // Сохранение избранного в UserDefaults
        private func saveFavorites() {
            UserDefaults.standard.set(Array(favoriteCoins), forKey: "FavoriteCoins")
        }
    
    //MARK: - Get data
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

extension Image {
    /// Initializes a SwiftUI `Image` from data.
    init?(data: Data) {
        #if canImport(UIKit)
        if let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            return nil
        }
        #elseif canImport(AppKit)
        if let nsImage = NSImage(data: data) {
            self.init(nsImage: nsImage)
        } else {
            return nil
        }   
        #else
        return nil
        #endif
    }
}
