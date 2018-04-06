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
        catch { fatalError(error.localizedDescription) }
        
        context.persistentStoreCoordinator = coordinator
        return context
    }()
    
    // Accessible initializer from outside of module.
    public init() {}
    
    public func newPost() -> Post {
        guard let entity = NSEntityDescription.entity(forEntityName: name, in: context) else { fatalError() }
        return Post(entity: entity, insertInto: context)
    }
    
    public func newPost(title: String, content: String, language: Language = .en, saving: Bool = true) -> Post {
        let post = newPost()
        post.title = title
        post.content = content
        post.language = language.rawValue
        post.creation_date = NSDate()
        post.modification_date = NSDate()
        
        if saving { save() }
        
        return post
    }
    
    public func getAllPosts() -> [Post] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: name)
        let posts = try? context.fetch(request)
        return posts as? [Post] ?? []
    }
    
    public func getPosts(in language: Language) -> [Post] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: name)
        request.predicate = NSPredicate(format: "language == %@", language.rawValue)
        
        let posts = try? context.fetch(request)
        return posts as? [Post] ?? []
    }
    
    public func getPosts(containing string: String) -> [Post] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: name)
//        request.predicate = NSPredicate(format: "title IN %@ || content IN %@", string)
        request.predicate = NSPredicate(format: "%@ IN title || %@ IN content", string, string)
        
        let posts = try? context.fetch(request)
        return posts as? [Post] ?? []
    }
    
    public func remove(_ post: Post) {
        context.delete(post)
    }
    
    public func remove(posts: [Post]) {
        posts.forEach { context.delete($0) }
    }
    
    public func save() {
        do { try context.save() }
        catch { fatalError(error.localizedDescription) }
    }
}
