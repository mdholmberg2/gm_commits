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
        
        self.presenter.delegate = self
        let productCell = UINib(nibName: "CommitTableViewCell", bundle: nil)
        self.tableView.register(productCell, forCellReuseIdentifier: "CommitTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitTableViewCell") as? CommitTableViewCell

        cell?.committerLabel.text = presenter.author(row: indexPath.row)
        cell?.shaLabel.text = presenter.sha(row: indexPath.row)
        cell?.messageLabel.text = presenter.message(row: indexPath.row)

        return cell!
    }
}

extension CommitsTableViewController: CommitsResult {
    func shouldRefreshList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func shouldShowNetworkError(message: String) {
        print("shouldShowNetworkError... \(message)")
    }
    
    
}


