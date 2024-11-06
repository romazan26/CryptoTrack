//
//  NewsView.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var vm: NewsViewModel
    
    var body: some View {
        ZStack {
            //MARK: - BackGround
            Color.homeBack.ignoresSafeArea()
            VStack {
                //MARK: - title view
                Text("News")
                    .foregroundStyle(.white)
                    .font(.system(size: 34, weight: .bold))
                
                //MARK: - Add button
                NavigationLink {
                    AddNewsView()
                } label: {
                    CustomButtonView(title: "Add a news item")
                }

                //MARK: - List news
                ScrollView {
                    if vm.news.isEmpty {
                        NoNewsView()
                    }else{
                        ForEach(vm.news) { news in
                            NavigationLink {
                                NewsInfoView()
                            } label: {
                                
                            }

                        }
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    NewsView(vm: NewsViewModel())
}
