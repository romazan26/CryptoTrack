//
//  LoadingViewModel.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct User: Codable {
    var name: String
    var photo: Data?
    var quotes: String
}

final class HomeViewModel: ObservableObject {
    @Published var selectedVew = 1
    @Published var isPresentSetting: Bool = false
    
    //MARK: - Favorites propertyes
    @Published var isFavoritesOrLisrt: Bool = true
    @Published var favoritesCoins: [CryptoCoin] = []
    
    //MARK: - Coins Properyes
    let service = CoinGeckoService()
    @Published var coins: [CryptoCoin] = []
    
    //MARK: - User Propertyes
    @Published var name: String = ""
    @Published var quotes: String = ""
    @Published var selectedImage: UIImage? = nil
    @Published var showImagePicker = false
    
    @Published var user: User? {
           didSet {
               saveUser()
           }
       }
    
    init() {
        getCoins()
        loadUser()
    }
    //MARK: - User Default
       private func saveUser() {
           guard let user = user else { return }
           
           if let encodedUser = try? JSONEncoder().encode(user) {
               UserDefaults.standard.set(encodedUser, forKey: "user")
           }
       }
       
       private func loadUser() {
           if let savedUserData = UserDefaults.standard.data(forKey: "user"),
              let decodedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
               user = decodedUser
           }
       }
       
    func updateUser(name: String, photo: UIImage?, quotes: String) {
           let photoData = photo?.jpegData(compressionQuality: 0.8)
        user = User(name: name, photo: photoData, quotes: quotes)
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
