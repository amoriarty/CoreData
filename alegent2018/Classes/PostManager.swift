//
//  PostManager.swift
//  alegent2018
//
//  Created by Alexandra Legent on 05/12/2017.
//

import Foundation
import CoreData

@available(iOS 10.0, *)
public class PostManager {
    private let ressource = "Post"
    
    public init() {
        let container = NSPersistentContainer(name: ressource)
        container.loadPersistentStores { description, error in
            if let error = error { fatalError("Failed to load Core Data stack: \(error)") }
            print("description: \(description)")
        }
    }
}
