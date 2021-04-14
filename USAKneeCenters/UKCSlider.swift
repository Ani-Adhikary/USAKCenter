//
//  UKCSlider.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 25/03/18.
//

import UIKit

class UKCSlider: UISlider {

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 7.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }

}
