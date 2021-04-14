//
//  PlanTableViewCell.swift
//  USAKneeCenters
//
//  Created by Anindita Adhikary on 23/03/18.
//

import UIKit

class PlanTableViewCell: UITableViewCell {
    
    @IBOutlet weak var planTitleLabel: UILabel!
    @IBOutlet weak var planCompletedDateLabel: UILabel!
    @IBOutlet weak var planImage: UIImageView!
    
    @IBOutlet weak var checkBoxButton: UKCCheckBoxButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
