//
//  PatientTrackingTableViewCell.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 26/03/18.
//

import UIKit

class PatientTrackingTableViewCell: UITableViewCell {

    @IBOutlet weak var trackNumber: UILabel!
    @IBOutlet weak var trackItemLabel: UILabel!
    
    @IBOutlet weak var slider: UKCSlider! {
        didSet {
            slider.setThumbImage(UIImage(), for: .normal)
            slider.setThumbImage(UIImage(), for: .highlighted)
        }
    }
    
    @IBAction func sliderChanged(_ sender: UKCSlider) {
        // Restrict slider to a fixed value
        let fixed = roundf(sender.value / 1.0) * 1.0;
        sender.setValue(fixed, animated: true)
    }

}
