//
//  CoinsVew.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct HomeVew: View {
    @StateObject var vm: HomeViewModel
    var body: some View {
        VStack(spacing: 10) {
            UserCellView(user: vm.user ?? User(name: "Hi!", photo: nil, quotes: ""))
            CoinsTableView(coins: vm.coins, vm: vm)
            VStack(alignment: .leading){
                Text("Latest news")
                    .foregroundStyle(.white)
                    .font(.system(size: 22, weight: .bold))
                NoNewsView()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.homeBack.ignoresSafeArea()
        HomeVew(vm: HomeViewModel())
            .padding()
    }
}
