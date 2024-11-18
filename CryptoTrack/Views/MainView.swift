//
//  HomeView.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vmHome = HomeViewModel()
    @StateObject var vmNews = NewsViewModel()
    @StateObject var vmSettings = SettingsViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Color.homeBack.ignoresSafeArea()
                VStack {
                    switch vmHome.selectedVew {
                    case 1: HomeVew(vm: vmHome, vmNews: vmNews, vmSettings: vmSettings)
                    case 2: FavoritesCoinsView(vm: vmHome)
                    case 3: NewsView(vm: vmNews)
                    default:
                        SettingsView(vm: vmSettings)
                    }
                    
                    Spacer()
                    
                    //MARK: - TabBar
                    CustomTabBarView(selectedTab: $vmHome.selectedVew)
                }.padding()
            }
        }
    }
}

#Preview {
    MainView()
}
