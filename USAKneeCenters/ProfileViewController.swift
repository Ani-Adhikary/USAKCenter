//
//  ProfileViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 17/02/18.
//

import UIKit

class ProfileViewController: UITableViewController {

    @IBOutlet weak var profileImageView: UKCProfileImageView!
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.handleSelectProfileImageView))
        profileImageView.addGestureRecognizer(tapGesture)
        profileImageView.isUserInteractionEnabled = true
    }
    
    @objc func handleSelectProfileImageView() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }

}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        //print("did Finish Picking Media")
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImage = image
            profileImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}
