//
//  SearchResultsTableViewController.swift
//  TimeLine2
//
//  Created by Bradley GIlmore on 4/24/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Properties
    var resultsArray: [SearchableRecord] = []
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell,
        let result = resultsArray[indexPath.row] as? Post else { return UITableViewCell() }
        
        cell.post = result

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let capturedCell = tableView.cellForRow(at: indexPath)
        self.presentingViewController?.performSegue(withIdentifier: "toPostDetailFromSearch", sender: capturedCell)
    }
}
