//
//  SignUpTermsOfServiceViewController.swift
//  USAKneeCenters
//
//  Created by Anindita Adhikary on 12/04/18.
//

import UIKit

class SignUpTermsOfServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func agreeButtonTouchUpInside(_ sender: UKCButton) {
        let signUpWelcomeVC = storyboard?.instantiateViewController(withIdentifier: "SignUpWelcomeScreen")
        self.navigationController?.pushViewController(signUpWelcomeVC!, animated: true)
    }
    
}
