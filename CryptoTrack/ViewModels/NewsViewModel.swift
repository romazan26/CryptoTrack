//
//  NewsViewModel.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import UIKit
import CoreData

final class NewsViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var news: [News] = []
    @Published var articles: [Article] = []
    
    @Published var simpleArticles: [Article] = []
    @Published var simpleTitle: String = ""
    @Published var simpleText: String = ""
    @Published var simpleImage: UIImage?
    
    init(){
        fetchNews()
        fetchArticles()
    }
    
    //MARK: - Save data
    func saveNews(){
        news.removeAll()
        manager.save()
        clearNews()
    }
    func saveArticles(){
        articles.removeAll()
        manager.save()
    }
    
    //MARK: - Add data
    func addNews(){
        let newNews = News(context: manager.context)
        newNews.title = simpleTitle
        saveArticles()
    }
    
    
    func addArticle(news: News){
        let newArticle = Article(context: manager.context)
        newArticle.text = simpleText
        newArticle.image = simpleImage
        newArticle.news = news
        saveNews()
    }
    
    //MARK: - Get data
    func fetchNews() {
        let request = NSFetchRequest<News>(entityName: "News")
        do{
            news = try manager.context.fetch(request)
        }catch let error{
            print(error)
        }
    }
    
    func fetchArticles() {
        let request = NSFetchRequest<Article>(entityName: "Article")
        do{
            articles = try manager.context.fetch(request)
        }catch let error{
            print(error)
        }
    }
    
    //MARK: - Clear data
    func clearNews(){
        simpleText = ""
        simpleImage = nil
        simpleText = ""
    }
    
}
