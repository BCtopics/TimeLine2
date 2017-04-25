//
//  AddPostTableViewController.swift
//  TimeLine2
//
//  Created by Bradley GIlmore on 4/24/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var selectedImageButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    
    
    
    //MARK: - IBActions
    
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        
        selectedImageButton.setTitle("", for: .normal)
        imageView.image = #imageLiteral(resourceName: "Kitten")
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        
        guard let caption = captionTextField.text else { return }
        guard let image = imageView.image else  { return }
        
        if !caption.isEmpty {
            
            PostController.shared.createPostWith(image: image, caption: caption)
            self.dismiss(animated: true, completion: nil)
            
        } else {
            
            let alertController = UIAlertController(title: "Missing Information", message: "Please check your image and caption then try again.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alertController, animated: true, completion: nil)
        }
        
        
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
