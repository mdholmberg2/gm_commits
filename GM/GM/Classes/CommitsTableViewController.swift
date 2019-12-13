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
    
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func refresh(_ sender: Any) {
        presenter.refreshUI()
    }
    
}

extension CommitsTableViewController: CommitsResult {
    func shouldRefreshList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func shouldShowNetworkError(message: String) {
        DispatchQueue.main.async {
            self.showErrorAlert(title: "Network Error", message: message)
        }
    }
}


