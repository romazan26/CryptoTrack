//
//  CoinsVew.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct HomeVew: View {
    @StateObject var vm: HomeViewModel
    @StateObject var vmNews: NewsViewModel
    @StateObject var vmSettings: SettingsViewModel
    var body: some View {
        VStack(spacing: 10) {
            UserCellView(user: vmSettings.user ?? User(name: "Hi!", photo: nil, quotes: ""))
            CoinsTableView(coins: vm.coins, vm: vm)
            VStack(alignment: .leading){
                Text("Latest news")
                    .foregroundStyle(.white)
                    .font(.system(size: 22, weight: .bold))
                if vmNews.news.isEmpty{
                    NoNewsView()
                }else{
                    NewsCellForMainView(news: vmNews.news.last!)
                }
                
            }
        }
    }
}

#Preview {
    ZStack {
        Color.homeBack.ignoresSafeArea()
        HomeVew(vm: HomeViewModel(), vmNews: NewsViewModel(), vmSettings: SettingsViewModel())
            .padding()
    }
}
