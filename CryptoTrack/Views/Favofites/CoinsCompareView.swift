//
//  CoinsCompareView.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import SwiftUI

struct CoinsCompareView: View {
    
    @StateObject var vm: HomeViewModel
    let coin: CryptoCoin
    
    var body: some View {
        ZStack {
            Color.homeBack.ignoresSafeArea()
            
            VStack{
                ScrollView{
                    //MARK: - First coin
                    CoinView(vm: vm, coin: coin)
                    
                    //MARK: - Second coin
                    if let compareCoin = vm.compareCoins {
                        CoinView(vm: vm, coin: compareCoin)
                    }
                }
                //MARK: - Choose Compare coin
                Button {
                    vm.isPresesntSearch = true
                } label: {
                    CustomButtonView(title: "Compare")
                }
            }.padding()
        }
        .sheet(isPresented: $vm.isPresesntSearch) {
            ListCompareCoinsView(vm: vm)
        }
    }
}

#Preview {
    CoinsCompareView(vm: HomeViewModel(), coin: PreviewData.instance.makePreviewCryptoCoin())
}
