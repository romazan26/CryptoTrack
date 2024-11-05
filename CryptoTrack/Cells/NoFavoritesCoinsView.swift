//
//  NoFavoritesCoinsView.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct NoFavoritesCoinsView: View {
    var body: some View {
        HStack {
            Image(.noNews)
                .resizable()
                .frame(width: 66, height: 66)
            VStack(alignment: .leading) {
                Text("Empty")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                Text("You haven't added anything to your favorites")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            Spacer()
        }
        .padding()
        .background {
            Color.white.opacity(0.05).cornerRadius(8)
        }
    }
}

#Preview {
    NoFavoritesCoinsView()
}
