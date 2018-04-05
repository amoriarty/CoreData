//
//  Post+CoreDataClass.swift
//  alegent2018
//
//  Created by Alexandre LEGENT on 4/5/18.
//
//

import Foundation
import CoreData

@objc(Post)
public class Post: NSManagedObject {
    
    public override var description: String {
        guard let title = title, let modification_date = modification_date else { return "" }
        return "\(title) - \(modification_date)"
    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }
    
    @NSManaged public var content: String?
    @NSManaged public var creation_date: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var language: String?
    @NSManaged public var modification_date: NSDate?
    @NSManaged public var title: String?
}
