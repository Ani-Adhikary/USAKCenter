//
//  SignUpViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 17/02/18.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!    
    @IBOutlet weak var inviteCodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpTouchUpInside(_ sender: UIButton) {
        
        do {
            try signUp()
            
        } catch LoginError.incompleteForm {
            Alert.showBasicAlert(title: "Incomplete Form", message: "Please fill out both email and password fields", vc: self)
        } catch LoginError.invalidEmail {
            Alert.showBasicAlert(title: "Invalid Email Format", message: "Please make sure you format your email correctly", vc: self)
        } catch LoginError.incorrectPasswordLength {
            Alert.showBasicAlert(title: "Password Too Short", message: "Password should be at least 8 characters", vc: self)
        } catch {
            Alert.showBasicAlert(title: "Unable To Login", message: "There was an error when attempting to login", vc: self)
        }
        
    }
    
    func signUp() throws {
        
        let email = emailTextField.text!
        let mobile = mobileTextField.text!
        let password = passwordTextField.text!
        let inviteCode = inviteCodeTextField.text!
        
        if email.isEmpty || mobile.isEmpty || password.isEmpty || inviteCode.isEmpty {
            throw LoginError.incompleteForm
        }
        
//        if !email.isValidEmail {
//            throw LoginError.invalidEmail
//        }
        
        if password.count < 2 {
            throw LoginError.incorrectPasswordLength
        }
        
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpUser")
        
        self.present(signUpVC!, animated: true, completion: nil)
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
