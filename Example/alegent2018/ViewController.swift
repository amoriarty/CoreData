//
//  ViewController.swift
//  alegent2018
//
//  Created by amoriarty on 12/05/2017.
//  Copyright (c) 2017 amoriarty. All rights reserved.
//

import UIKit
import alegent2018

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creating manager
        let manager = PostManager()

        // Creating a post and manually save it
        let post = manager.newPost()
        post.title = "Please appear"
        post.content = "Please !!!!"
        post.creation_date = NSDate()
        post.modification_date = NSDate()
        post.language = Language.en.rawValue
        manager.save()
        
        print("\n\n")
        manager.getAllPosts().forEach { print($0) }
        
        // Creating 3 more posts, with one not saved by default.
        _ = manager.newPost(title: "Post 1", content: "Some content")
        _ = manager.newPost(title: "Post 2", content: "Some more content", language: .fr)
        _ = manager.newPost(title: "More post", content: "And manually saved", saving: false)
        
        print("\n\n")
        manager.getAllPosts().forEach { print($0) }
        
        // Removing first post and saving previous one.
        manager.remove(post)
        manager.save()
        
        print("\n\n")
        manager.getAllPosts().forEach { print($0) }
        
        // Getting all french post.
        print("\n\nFrench Post:")
        let frenchPosts = manager.getPosts(in: .fr)
        frenchPosts.forEach { print($0) }
        
        // Removing all french posts
        manager.remove(posts: frenchPosts)
        
        print("\n\n")
        manager.getPosts(in: .fr).forEach { print($0) }
        
        // Getting all posts containing "content" word
        print("\n\nPost containing \"content\":")
        manager.getPosts(containing: "content").forEach { print($0) }
    }
}

