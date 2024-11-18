//
//  NewsCellView.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI

struct NewsCellView: View {
    @ObservedObject var news: News
    var body: some View {
        ZStack {
            Color.white.opacity(0.05).cornerRadius(10)
            HStack(alignment: .top) {
                if let articles = news.article?.allObjects as? [Article] {
                    if let image = articles.first?.image {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 90, height: 126)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(news.title ?? "")
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                        Text(articles.first?.text ?? "")
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                Spacer()
            }.padding()
        }
        .frame(height: 158)
    }
}

#Preview {
    NewsCellView(news: News())
}
