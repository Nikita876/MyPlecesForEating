//
//  NewPlaceViewControllerController.swift
//  MyPlecesForEating
//
//  Created by Никита Коголенок on 4.06.21.
//

import UIKit

class NewPlaceViewControllerController: UITableViewController {
    // MARK: - Outlet
    @IBOutlet weak var imageOfPlace: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "photo")
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(sourse: .camera)
            }
            cameraAction.setValue(cameraIcon, forKey: "image")
            cameraAction.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photoAction = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            photoAction.setValue(photoIcon, forKey: "image")
            photoAction.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(photoAction)
            actionSheet.addAction(cancelAction)
            
            present(actionSheet, animated: true, completion: nil)
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
// MARK: - Work with image
extension NewPlaceViewControllerController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(sourse: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageOfPlace.image = info[.editedImage] as? UIImage
        imageOfPlace.contentMode = .scaleAspectFill
        imageOfPlace.clipsToBounds = true
        dismiss(animated: true)
    }
}
