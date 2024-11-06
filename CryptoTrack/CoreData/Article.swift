//
//  Article+CoreDataProperties.swift
//
//
//  Created by Роман on 06.11.2024.
//
//  This file was automatically generated and should not be edited.
//

import UIKit
import CoreData

@objc(Article)
public class Article: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var image: UIImage?
    @NSManaged public var text: String?
    @NSManaged public var news: News?

}

extension Article : Identifiable {

}
