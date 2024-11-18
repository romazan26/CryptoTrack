//
//  ListCompareCoinsView.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import SwiftUI

struct ListCompareCoinsView: View {
    @StateObject var vm: HomeViewModel
    @FocusState var keyboardFocus: Bool
    var body: some View {
        ZStack {
            Color.compareColorBack.ignoresSafeArea()
            VStack {
                //MARK: - Tite view
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 40, height: 4)
                    .foregroundStyle(.gray)
                    .opacity(0.4)
                Text("Coins")
                    .foregroundStyle(.white)
                    .font(.title)
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.gray)
                    .opacity(0.4)
                
                //MARK: - Search text field
                SearchTextFieldView(searchText: $vm.searchCoins)
                    .focused($keyboardFocus)
                
                
                //MARK: - List coins
                ScrollView {
                    ForEach(vm.coins.filter({vm.isSearching(coin: $0)}), id: \.id) { coin in
                        VStack {
                            SearchCoinCellView(coin: coin, isChoose: vm.isChoose(coin: coin))
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 1)
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.gray)
                                .opacity(0.4)
                                
                        }.onTapGesture {
                            vm.compareCoins = coin
                        }
                    }
                }
            }.padding()
        }.onTapGesture {
            keyboardFocus = false
        }
    }
}

#Preview {
    ListCompareCoinsView(vm: HomeViewModel())
}
