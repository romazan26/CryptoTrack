//
//  SettingsViewModel.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI

struct User: Codable {
    var name: String
    var photo: Data?
    var quotes: String
}

final class SettingsViewModel: ObservableObject {
    //MARK: - Settings Propertyes
    @State var isPresentShare = false
    @State var isPresentPolicy = false
    @State var urlShare = "https://www.apple.com/app-store/"
    @State var urlPolicy = "https://www.termsfeed.com/live/87cd67b0-cfe9-44bf-be70-a115ab3d0c1e"
    
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
       
    func updateUser() {
        let photoData = selectedImage?.jpegData(compressionQuality: 0.8)
        user = User(name: name, photo: photoData, quotes: quotes)
       }
}
