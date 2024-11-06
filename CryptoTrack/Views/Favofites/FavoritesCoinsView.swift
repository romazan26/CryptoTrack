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
                    CoinsTableView(coins: vm.coins, vm: vm, backGroundImage: false)
                }else{
                    if vm.favoriteCoins.isEmpty{
                        NoFavoritesCoinsView()
                    }else{
                        CoinsTableView(coins: vm.coins.filter({vm.isFavorite(coin: $0)}),
                                       vm: vm,
                                       backGroundImage: false)
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
