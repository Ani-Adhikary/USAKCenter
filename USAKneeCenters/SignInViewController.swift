//
//  SignInViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 17/02/18.
//

import UIKit

enum LoginError: Error {
    case incompleteForm
    case invalidEmail
    case incorrectPasswordLength
    case passwordsDoNotMatch
}

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInTouchUpInside(_ sender: UIButton) {
        
        do {
            try login()
            
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
    
    func login() throws {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if password.count < 8 {
            throw LoginError.incorrectPasswordLength
        }
        
        // Pretend this is great code that logs in my user.
        // It really is amazing...
        
        if email == "patient@gmail.com" && password == "knee@123" {
            let mainVC = MainTabBarController()
            //mainVC.userType = "d"
            mainVC.userType = "p"
    
            mainVC.setupTabBar()
            self.present(mainVC, animated: true, completion: nil)
        }  else if email == "doctor@gmail.com" && password == "knee@123" {
            let mainVC = MainTabBarController()
            mainVC.userType = "d"
            
            mainVC.setupTabBar()
            self.present(mainVC, animated: true, completion: nil)
        } else {
            Alert.showBasicAlert(title: "Unable To Login", message: "Invalid email or password", vc: self)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

