//
//  CoinView.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import SwiftUI

struct CoinView: View {
    @StateObject var vm: HomeViewModel
    let coin: CryptoCoin
    // Определяем сетку 3x3
        let columns = [
            GridItem(),
            GridItem(),
            GridItem()
        ]
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: coin.image)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(width: 42, height: 42)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(coin.symbol.uppercased())
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                    Text("$\(formatMarketCap(coin.marketCap))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                //MARK: - Make favorite button
                Button(action: {
                    if vm.isFavorite(coin: coin) {
                        vm.removeFavorite(coin: coin)
                    } else {
                        vm.addFavorite(coin: coin)
                    }
                }) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(vm.isFavorite(coin: coin) ? .yellow : .gray)
                        .padding(10)
                        .background {
                            Color.white.opacity(0.05).cornerRadius(8)
                        }
                }
            }
            LazyVGrid(columns: columns, spacing: 5) {
                            // Первый ряд
                CoinInfoTableCellView(textLabel: "Price",
                                      detailLabel: "$\(coin.currentPrice)")
                CoinInfoTableCellView(textLabel: "24H %",
                                      detailLabel: "\(coin.priceChangePercentage24h)%")
                CoinInfoTableCellView(textLabel: "Market Cap",
                                      detailLabel: "$\(formatMarketCap(coin.marketCap))")

                            // Второй ряд
                CoinInfoTableCellView(textLabel: "Market Cap Ch",
                                      detailLabel: formatMarketCap(coin.marketCapChange24h ?? 0))
                CoinInfoTableCellView(textLabel: "24h Volume",
                                      detailLabel: formatMarketCap(coin.totalVolume))
                CoinInfoTableCellView(textLabel: "Circulating",
                                      detailLabel: formatMarketCap(coin.circulatingSupply))

                            // Третий ряд
                CoinInfoTableCellView(textLabel: "Max Supply",
                                      detailLabel: formatMarketCap(coin.maxSupply ?? 0))
                CoinInfoTableCellView(textLabel: "Start Date",
                                      detailLabel: coin.athDate)
                CoinInfoTableCellView(textLabel: "Rank",
                                      detailLabel: "\(coin.marketCapRank ?? 0)")
                        }
            
                        
            Spacer()
        }.padding()
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
        Color.homeBack
        CoinView(vm: HomeViewModel(), coin: PreviewData.instance.makePreviewCryptoCoin())
    }
}
