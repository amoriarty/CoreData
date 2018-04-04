//
//  CoreDataManager.swift
//  alegent2018
//
//  Created by Alexandre LEGENT on 4/4/18.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private var documentDirectory: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
    }
    
    private let model: NSManagedObjectModel = {
        guard let object = NSManagedObjectModel.mergedModel(from: [Bundle(for: Post.classForCoder())]) else { fatalError() }
        return object
    }()
    
    private lazy var coordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        let url = URL(fileURLWithPath: "alegent2018.sqlite", relativeTo: documentDirectory)
        
        guard let store = try? coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil) else { fatalError() }
        return coordinator
    }()
    
    private lazy var context: NSManagedObjectContext = {
        var context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        return context
    }()
}
