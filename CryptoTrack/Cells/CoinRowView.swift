//
//  CoinRowView.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CryptoCoin
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank ?? 0)")
                .frame(width: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack(spacing: 10) {
                AsyncImage(url: URL(string: coin.image)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(width: 24, height: 24)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(coin.symbol.uppercased())
                        .bold()
                        .foregroundStyle(.white)
                    Text("$\(formatMarketCap(coin.marketCap))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 80, alignment: .leading)
            
            Spacer()
            
            Text("$\(formatPrice(coin.currentPrice))")
                .frame(width: 90, alignment: .trailing)
                .foregroundStyle(.white)
                
            
            HStack(spacing: 4) {
                Image(systemName: coin.priceChangePercentage24h >= 0 ? "arrow.up" : "arrow.down")
                    .foregroundColor(coin.priceChangePercentage24h >= 0 ? .green : .red)
                Text(String(format: "%.2f%%", coin.priceChangePercentage24h))
                    .foregroundColor(coin.priceChangePercentage24h >= 0 ? .green : .red)
                    .font(.system(size: 12))
            }
            .frame(width: 65, alignment: .trailing)
        }
        .padding([.top, .bottom], 8)
    }
    
    // Вспомогательные функции форматирования
    private func formatMarketCap(_ marketCap: Double) -> String {
        let trillion = 1_000_000_000_000.0
        let billion = 1_000_000_000.0
        if marketCap >= trillion {
            return String(format: "%.2f T", marketCap / trillion)
        } else if marketCap >= billion {
            return String(format: "%.2f B", marketCap / billion)
        } else {
            return String(format: "%.2f M", marketCap / 1_000_000.0)
        }
    }
    
    private func formatPrice(_ price: Double) -> String {
        return String(format: "%.2f", price)
    }
}

#Preview {
    ZStack {
        Color.gray
        CoinRowView(coin: PreviewData.instance.makePreviewCryptoCoin())
            .padding()
    }
}
