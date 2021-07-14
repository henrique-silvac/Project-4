//
//  TableViewController.swift
//  Project 4
//
//  Created by Henrique Silva on 14/07/21.
//

import UIKit

class TableViewController: UITableViewController {
    var websitesViewController = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Easy Browser"
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websitesViewController.websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebCell", for: indexPath)
        cell.textLabel?.text = websitesViewController.websites[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let wvController = storyboard?.instantiateViewController(identifier: "WebView") as? ViewController {
            wvController.websiteToLoad = websitesViewController.websites[indexPath.row]
            navigationController?.pushViewController(wvController, animated: true)
        }
    }

}
