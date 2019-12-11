//
//  CommitsTableViewController.swift
//  GM
//
//  Created by M D Holmberg II on 12/8/19.
//  Copyright © 2019 M D Holmberg II. All rights reserved.
//

import UIKit

class CommitsTableViewController: UITableViewController {
    
    let presenter = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productCell = UINib(nibName: "CommitTableViewCell", bundle: nil)
        self.tableView.register(productCell, forCellReuseIdentifier: "CommitTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitTableViewCell") as? CommitTableViewCell

        // Configure the cell...

        return cell!
    }
    

    

}
