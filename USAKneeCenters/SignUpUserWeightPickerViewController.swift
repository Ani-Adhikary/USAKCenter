//
//  SignUpUserWeightPickerViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 02/03/18.
//

import UIKit

class SignUpUserWeightPickerViewController: UIViewController {
    
    @IBOutlet weak var userWeightPickerView: UIPickerView!
    
    var selectedWeight = 0
     var weights = [32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextTouchUpInside(_ sender: UIButton) {
        
        print("Selected weight is \(selectedWeight)")
        let signUpUserGenderPickerVC = storyboard?.instantiateViewController(withIdentifier: "SignUpGenderPickerScreen")
        self.navigationController?.pushViewController(signUpUserGenderPickerVC!, animated: true)
    }
    
}

extension SignUpUserWeightPickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weights.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(weights[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedWeight = weights[row]
    }
    
}
