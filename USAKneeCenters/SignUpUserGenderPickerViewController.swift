//
//  SignUpUserGenderPickerViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 02/03/18.
//

import UIKit

class SignUpUserGenderPickerViewController: UIViewController {

    @IBOutlet weak var genderPickerView: UIPickerView!
    
    var genderList = ["FEMALE", "MALE"]
    var selectedGender = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextTouchUpInside(_ sender: UKCButton) {
        print("Selected gender is \(selectedGender)")
        let signUpTermsOfServiceVC = storyboard?.instantiateViewController(withIdentifier: "SignUpAgreeTermsOfServiceScreen")
        self.navigationController?.pushViewController(signUpTermsOfServiceVC!, animated: true)
    }
}

extension SignUpUserGenderPickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGender = genderList[row]
    }
}

