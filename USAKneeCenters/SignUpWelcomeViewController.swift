//
//  SignUpWelcomeViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 25/03/18.
//

import UIKit

class SignUpWelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //TODOD- Hardcoded d need to change later on
    @IBAction func welcomeUserTouchUpInside(_ sender: UIButton) {
        let mainVC = MainTabBarController()
        
        mainVC.userType = "d"
        mainVC.setupTabBar()
        self.present(mainVC, animated: true, completion: nil)
    }
    
}
