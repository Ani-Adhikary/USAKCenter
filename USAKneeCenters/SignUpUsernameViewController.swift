//
//  SignUpUsernameViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 02/03/18.
//

import UIKit

class SignUpUsernameViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func nextTouchUpInside(_ sender: UIButton) {
        
        do {
            try signUp()
        } catch LoginError.incompleteForm {
            Alert.showBasicAlert(title: "Incomplete Form", message: "Please fill out both first name and last name fields", vc: self)
        } catch {
            Alert.showBasicAlert(title: "Unable To Sign Up", message: "There was an error when attempting to sign up", vc: self)
        }
    }
    
    func signUp() throws {
        
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        
        if firstName.isEmpty || lastName.isEmpty {
            throw LoginError.incompleteForm
        }
        
        let signUpBirthdayPickerVC = storyboard?.instantiateViewController(withIdentifier: "SignUpBirthdayPickerScreen")
        self.navigationController?.pushViewController(signUpBirthdayPickerVC!, animated: true)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
