//
//  NewPlaceViewControllerController.swift
//  MyPlecesForEating
//
//  Created by Никита Коголенок on 4.06.21.
//

import UIKit

class NewPlaceViewControllerController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}

// MARK: - Text field delegate

extension NewPlaceViewControllerController: UITextFieldDelegate {
    // Скрываем кдавиатуру по нажатию Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
