//
//  CoinInfoTableCellView.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import SwiftUI

struct CoinInfoTableCellView: View {
    let textLabel: String
    let detailLabel: String
    var body: some View {
        VStack(alignment: .trailing) {
            Text(textLabel)
                .foregroundStyle(.gray)
                .minimumScaleFactor(0.5)
            Text(detailLabel)
                .foregroundStyle(.white)
                .minimumScaleFactor(0.5)
                
        }
        .frame(width: 80, height: 40)
        .padding()
        .background {
            Color.white.opacity(0.05)
                .cornerRadius(8)
        }
    }
}

#Preview {
    ZStack {
        Color.homeBack
        CoinInfoTableCellView(textLabel: "Price", detailLabel: "72184.84")
    }
}
