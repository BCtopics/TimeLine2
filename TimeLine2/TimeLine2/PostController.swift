//
//  PostController.swift
//  TimeLine2
//
//  Created by Bradley GIlmore on 4/24/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class PostController {
    
    //MARK: - Singleton 
    
    static let shared = PostController()
    
    
    //MARK: - Properties
    var posts = [Post]()
    
    
    //MARK: - CRUD
    
    func createPostWith(image: UIImage, caption: String) {
        guard let imageData = UIImageJPEGRepresentation(image, 1.0) else { return }
        
        
        let newPost = Post(photoData: imageData)
        posts.append(newPost)
        let _ = addComment(toPost: newPost, text: caption)
        
        
    }
    
    func addComment(toPost: Post, text: String) {
        let newComment = Comment(text: text, post: toPost)
        toPost.comments.append(newComment)
    }
    
}
