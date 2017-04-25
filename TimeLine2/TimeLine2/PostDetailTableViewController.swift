//
//  PostDetailTableViewController.swift
//  TimeLine2
//
//  Created by Bradley GIlmore on 4/24/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
        
    }
    
    //MARK: - Properties
    
    var post: Post? {
        didSet {
//            updateViews()
        }
    }
    
    //MARK: - UpdateViews
    
    func updateViews(){
        
        guard let post = post else { return }
        
        imageView.image = post.photo
        self.tableView.reloadData()
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: - IBActions
    
    @IBAction func commentButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Comment Text"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            
            guard let currentPost = self.post,
                let commentBody = alert.textFields?.first?.text else { return }
            
            PostController.shared.addComment(toPost: currentPost, text: commentBody)
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        
        
        
    }
    
    @IBAction func followButtonTapped(_ sender: Any) {
        
        
        
    }
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)

        guard let post = post else { return cell }
        let comment = post.comments[indexPath.row]
        
        cell.textLabel?.text = comment.text


        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
