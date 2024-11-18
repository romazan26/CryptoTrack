//
//  NewsInfoView.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import SwiftUI

struct NewsInfoView: View {
    let news: News
    @StateObject var vm: NewsViewModel
    @Environment(\.dismiss) var dismiss
    @State private var isPresented: Bool = false
    var body: some View {
        ZStack {
            //MARK: - BackGround
            Color.homeBack.ignoresSafeArea()
            
            //MARK: - Main stack
            VStack(alignment: .leading) {
                Text(news.title ?? "")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                if let articles = news.article?.allObjects as? [Article] {
                    ScrollView {
                        ForEach(articles) { article in
                            VStack(alignment: .leading){
                                if let image = article.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(height: 200)
                                        .frame(maxWidth: .infinity)
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(8)
                                }
                                Text(article.text ?? "")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 17))
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
                
                //MARK: - Edit button
                Button {
                    isPresented = true
                    vm.simpleNews = news
                    vm.fillData()
                    vm.isEditing = true
                } label: {
                    CustomButtonView(title: "Edit")
                }


            }
            .fullScreenCover(isPresented: $isPresented, content: {
                AddNewsView(vm: vm)
            })
            .padding()
                .toolbar {
                    ToolbarItem {
                        Button("Delete") {
                            vm.deleteNews(news: news)
                            dismiss()
                        }
                    }
                }
        }
    }
}

//#Preview {
//    NewsInfoView()
//}
