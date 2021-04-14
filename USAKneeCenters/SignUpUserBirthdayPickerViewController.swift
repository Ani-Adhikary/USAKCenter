//
//  SignUpUserBirthdayPickerViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 02/03/18.
//

import UIKit

class SignUpUserBirthdayPickerViewController: UIViewController {

    @IBOutlet weak var userBirthDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userBirthDatePicker.set18YearValidation()
    }
    
    @IBAction func nextTouchUpInside(_ sender: UIButton) {
        userBirthDatePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.string(from: userBirthDatePicker.date)
        print(selectedDate)
        
        let signUpUserWeightPickerVC = storyboard?.instantiateViewController(withIdentifier: "SignUpWeightPickerScreen")
        self.navigationController?.pushViewController(signUpUserWeightPickerVC!, animated: true)
    }
    
}

extension UIDatePicker {
    func set18YearValidation() {
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.year = -18
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.year = -100
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
} }
