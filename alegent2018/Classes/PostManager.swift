//
//  PostManager.swift
//  alegent2018
//
//  Created by Alexandra Legent on 05/12/2017.
//

import Foundation
import CoreData

public final class PostManager {
    private let name = "Post"
    
    private let context: NSManagedObjectContext = {
        guard let model = NSManagedObjectModel.mergedModel(from: [Bundle(for: Post.classForCoder())]) else { fatalError() }
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        let url = directory?.appendingPathComponent("alegent2018.sqlite")
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        do { try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil) }
        catch { fatalError() }
        
        context.persistentStoreCoordinator = coordinator
        return context
    }()
    
    // Accessible initializer from outside of module.
    public init() {}
    
    // TODO: newArticle
    public func newPost() -> Post {
        guard let entity = NSEntityDescription.entity(forEntityName: name, in: context) else { fatalError() }
        return Post(entity: entity, insertInto: context)
    }
    
    // TODO: getAllArticles
    // TODO: getArticles(withLang lang : String)
    // TODO: getArticles(containString str : String)
    // TODO: removeArticle(article : Article)
    // TODO: save
}
