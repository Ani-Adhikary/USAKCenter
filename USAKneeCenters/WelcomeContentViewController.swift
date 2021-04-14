//
//  WelcomeContentViewController.swift
//
//  Created by Anindita Adhikary on 20/02/18.
//  Copyright © 2018 Ani Adhikary. All rights reserved.
//

import UIKit

class WelcomeContentViewController: UIViewController {
    
    @IBOutlet weak var welcomeImageView: UIImageView!
    @IBOutlet weak var planLabel: UILabel!
    @IBOutlet weak var planDescriptionLabel: UILabel!
    
    var pageIndex = 0
    var welcomeImage: String?
    var plan: String?
    var planDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let welcomeImage = welcomeImage, let plan = plan else {
            return
        }
        
        welcomeImageView.image = UIImage(named: welcomeImage)
        planLabel.text = plan
        
        if let planDescription = planDescription {
            planDescriptionLabel.text = planDescription
        }
    }
}
