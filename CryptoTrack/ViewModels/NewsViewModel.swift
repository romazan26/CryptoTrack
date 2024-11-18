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
    
    @Published var isEditing: Bool = false
    
    @Published var simpleNews: News!
    @Published var simpleTextarticle: [String] = []
    @Published var simpleImagearticle: [UIImage] = []
    @Published var simpleTitle: String = ""
    @Published var simpleText: String = ""
    @Published var simpleImage: UIImage = .noImageArticle
    
    init(){
        fetchNews()
        fetchArticles()
    }
    
    //MARK: - Edit data
    func editNews(){
        let request = NSFetchRequest<News>(entityName: "News")
        do{
            news = try manager.context.fetch(request)
            if let editNews = news.first(where: {$0.id == simpleNews.id}){
                editNews.title = simpleTitle
                if let articles = editNews.article?.allObjects as? [Article]{
                    for article in articles{
                        manager.context.delete(article)
                    }
                    saveArticles()
                }
                if simpleTextarticle.isEmpty{
                    addSimplleArticle()
                }
                for i in 0...simpleTextarticle.count - 1{
                    addArticle(news: editNews, text: simpleTextarticle[i], image: simpleImagearticle[i])
                }
            }
        }catch let error{
            print(error.localizedDescription)
        }
        saveNews()
        clearNews()
    }
    
    //MARK: - Fill data to edit
    func fillData(){
        simpleTextarticle.removeAll()
        simpleImagearticle.removeAll()
        simpleTitle = simpleNews?.title ?? ""
        if let articles = simpleNews?.article?.allObjects as? [Article]{
            for article in articles {
                simpleTextarticle.append(article.text ?? "")
                simpleImagearticle.append(article.image ?? .noImageArticle)
            }
        }
    }
    
    //MARK: - Delete data
    func deleteNews(news: News){
        if let articles = news.article?.allObjects as? [Article]{
            for article in articles{
                manager.context.delete(article)
            }
            saveArticles()
        }
        manager.context.delete(news)
        saveNews()
        clearNews()
    }
    
    //MARK: - Save data
    func saveNews(){
        news.removeAll()
        manager.save()
        fetchNews()
        clearNews()
    }
    func saveArticles(){
        articles.removeAll()
        manager.save()
        fetchArticles()
    }
    
    //MARK: - Add data
    func addNews(){
        let newNews = News(context: manager.context)
        newNews.title = simpleTitle
        if simpleTextarticle.isEmpty{
            addSimplleArticle()
        }
        for i in 0...simpleTextarticle.count - 1{
            addArticle(news: newNews, text: simpleTextarticle[i], image: simpleImagearticle[i])
        }
        saveNews()
    }
    
    
    func addArticle(news: News, text: String, image: UIImage){
        let newArticle = Article(context: manager.context)
        newArticle.text = text
        if image != .noImageArticle{
            newArticle.image = image
        }
        newArticle.news = news
        saveArticles()
    }
    
    func addSimplleArticle(){
        simpleTextarticle.append(simpleText)
        simpleImagearticle.append(simpleImage)
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
        simpleImage = .noImageArticle
        simpleText = ""
        simpleTextarticle.removeAll()
        simpleImagearticle.removeAll()
    }
    
}
