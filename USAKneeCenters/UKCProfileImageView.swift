//
//  UKCProfileImageView.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 20/03/18.
//

import UIKit

class UKCProfileImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 40
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }

}
