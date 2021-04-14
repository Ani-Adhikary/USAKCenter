//
//  UKCTextField.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 10/03/18.
//

import UIKit

@IBDesignable
class UKCTextField: UITextField {

    override func draw(_ rect: CGRect) {
        layer.frame.size.height = 40
        //backgroundColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            
            //let imageView = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
            
            var width = leftPadding + 20
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width = width + 5
            }
            
            //let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
            leftView = view
        } else {
            leftViewMode = .never
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: tintColor])
    }


}
