//
//  Comment.swift
//  TimeLine2
//
//  Created by Bradley GIlmore on 4/24/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class Comment {
 
    //MARK: - Properties
    
    let text: String
    let timestamp: Date
    let post: Post
    
    //MARK: - Initializers
    
    init(text: String, timestamp: Date = Date(), post: Post){
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
}
