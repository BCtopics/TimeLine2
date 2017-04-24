//
//  Post.swift
//  TimeLine2
//
//  Created by Bradley GIlmore on 4/24/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class Post {
    
    //MARK: - Properties
    
    let photoData: Data?
    let timestamp: Date
    var comments: [Comment]
    var photo: UIImage? {
        guard let photoData = self.photoData else { return nil }
        let newImage = UIImage(data: photoData)
        return newImage
    }
    
    
    //MARK: - Initializers 
    
    init(photoData: Data?, timestamp: Date = Date(), comments: [Comment] = []) {
        self.photoData = photoData
        self.timestamp = timestamp
        self.comments = comments
    }
    
}
