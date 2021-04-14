//
//  UKCCheckBoxButton.swift
//  USAKneeCenters
//
//  Created by Anindita Adhikary on 23/03/18.
//

import UIKit

class UKCCheckBoxButton: UIButton {

    let checkedImage = UIImage(named: "GreenCheckBox")
    let uncheckedImage = UIImage(named: "GrayCheckBox")
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(uncheckedImage, for: .normal)
            } else {
                self.setImage(checkedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.isUserInteractionEnabled = false
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            if isChecked == true {
                isChecked = false
            } else {
                isChecked = true
            }
        }
    }

}
