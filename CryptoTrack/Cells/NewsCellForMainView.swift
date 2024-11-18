//
//  NewsCellForMainView.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI

struct NewsCellForMainView: View {
    let news: News
    var body: some View {
        
            VStack(alignment: .leading) {
                Text(news.title ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                if let articles = news.article?.allObjects as? [Article]{
                    Text(articles.first?.text ?? "")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                }
            }
            
        .frame(height: 98)
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                Color.white.opacity(0.05).cornerRadius(8)
            }
    }
}

//#Preview {
//    NewsCellForMainView()
//}
