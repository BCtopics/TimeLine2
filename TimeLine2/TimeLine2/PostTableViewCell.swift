//
//  PostTableViewCell.swift
//  TimeLine2
//
//  Created by Bradley GIlmore on 4/24/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    var post: Post? {
        didSet{
            updateViews()
        }
    }
    
    //MARK: - Private Functions
    
    private func updateViews(){
        postImage.image = post?.photo
    }
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var postImage: UIImageView!
    

}
