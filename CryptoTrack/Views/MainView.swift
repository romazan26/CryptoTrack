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
    var body: some View {
        NavigationView {
            ZStack {
                Color.homeBack.ignoresSafeArea()
                VStack {
                    switch vmHome.selectedVew {
                    case 1: HomeVew(vm: vmHome)
                    case 2: FavoritesCoinsView(vm: vmHome)
                    case 3: NewsView(vm: vmNews)
                    default:
                        Text("Settings")
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
