//
//  CoinsTable.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct CoinsTableView: View {
     var coins: [CryptoCoin]
    
    @StateObject var vm: HomeViewModel
    var backGroundImage = true
    var body: some View {
        VStack(alignment: .leading) {
                    Text("Coins")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading)
                        .foregroundStyle(.white)
                    
                    HStack {
                        Text("#").frame(width: 40, alignment: .leading)
                        Text("Market Cap").frame(width: 80, alignment: .leading)
                        Spacer()
                        Text("Price").frame(width: 80, alignment: .trailing)
                        Text("24h %").frame(width: 50, alignment: .trailing)
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding([.leading, .trailing])
                    
                    Divider()
                    
                    ScrollView {
                        ForEach(coins, id: \.id) { coin in
                            NavigationLink {
                                CoinsCompareView(vm: vm, coin: coin)
                            } label: {
                                VStack{
                                    CoinRowView(coin: coin)
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 1)
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.gray)
                                }
                            }

                            
                        }
                    }
                }
        .padding()
        .background {
            if backGroundImage {
                Image(.backTable)
                    .resizable()
            }else{
                Color.white.opacity(0.05)
                    .cornerRadius(8)
            }
            
        }
    }
}

#Preview {
    CoinsTableView(coins: PreviewData.instance.makePreviewCryptoCoins(), vm: HomeViewModel())
}
