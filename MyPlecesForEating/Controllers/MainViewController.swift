//
//  MainViewController.swift
//  MyPlecesForEating
//
//  Created by Никита Коголенок on 31.05.21.
//

import UIKit

class MainViewController: UITableViewController {
    // MARK: - Variables
    let restaurantsName = ["McDonald's", "Papa Doner", "Dodo pizza", "Papa Djons", "KFC", "Burger King"]
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = restaurantsName[indexPath.row]

        return cell
    }
}
