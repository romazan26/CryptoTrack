//
//  SearchCoinCellView.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import SwiftUI

struct SearchCoinCellView: View {
    let coin: CryptoCoin
    var isChoose: Bool = false
    var body: some View {
        HStack {
            Image(systemName: isChoose ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(isChoose ? .blue : .white)
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width: 42, height: 42)
            Text(coin.symbol.uppercased())
                .bold()
                .foregroundStyle(.white)
            
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.5)
        SearchCoinCellView(coin: PreviewData.instance.makePreviewCryptoCoin())
    }
}
