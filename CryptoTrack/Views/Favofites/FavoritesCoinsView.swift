//
//  FavoritesCoinsView.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct FavoritesCoinsView: View {
    @StateObject var vm: HomeViewModel
    var body: some View {
        ZStack {
            Color.homeBack.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Coins")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                CustomSwitchButtonView(isOn: $vm.isFavoritesOrLisrt , nameFirst: "List" , nameSecond: "Favorites")
                
                if vm.isFavoritesOrLisrt {
                    CoinsTableView(coins: vm.coins, backGroundImage: false)
                }else{
                    if vm.favoritesCoins.isEmpty{
                        NoFavoritesCoinsView()
                    }else{
                        CoinsTableView(coins: vm.favoritesCoins, backGroundImage: false)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    FavoritesCoinsView(vm: HomeViewModel())
}
