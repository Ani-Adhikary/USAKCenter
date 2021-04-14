//
//  PlanViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 17/02/18.
//

import UIKit

class PlanViewController: UIViewController {

    @IBOutlet weak var planTableView: UITableView!
    
    var plans = [
        PatientPlan(planTitle: "Physical Therapy", planCompletedDate: "Completed: 08-12-2017", planImage: "Heart"),
        PatientPlan(planTitle: "Visco Injections", planCompletedDate: "Completed: 08-12-2017", planImage: "Injection"),
        PatientPlan(planTitle: "Knee Brace", planCompletedDate: "Completed:", planImage: "Heart"),
        PatientPlan(planTitle: "Medications", planCompletedDate: "Completed:", planImage: "Medication"),
        PatientPlan(planTitle: "PRP Injections", planCompletedDate: "Completed:", planImage: "Injection"),
        PatientPlan(planTitle: "Home Therapy", planCompletedDate: "Completed:", planImage: "Heart")
    ]
    
    var rowsWhichAreChecked = [IndexPath]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PlanViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let planCell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath) as! PlanTableViewCell
        
        let plan = plans[indexPath.row]
        planCell.planTitleLabel?.text = plan.planTitle
        planCell.planCompletedDateLabel.text = plan.planCompletedDate
        planCell.planImage.image = UIImage(named: plan.planImage)
        
        let isRowChecked = rowsWhichAreChecked.contains(indexPath)
        
        if(isRowChecked == true) {
            planCell.checkBoxButton.isChecked = true
            planCell.checkBoxButton.buttonClicked(sender: planCell.checkBoxButton)
        } else {
            planCell.checkBoxButton.isChecked = false
            planCell.checkBoxButton.buttonClicked(sender: planCell.checkBoxButton)
        }
        
        return planCell
    }
}

extension PlanViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        planTableView.deselectRow(at: indexPath, animated: true)
        
        let cell:PlanTableViewCell = tableView.cellForRow(at: indexPath) as! PlanTableViewCell
        // cross checking for checked rows
        if(rowsWhichAreChecked.contains(indexPath) == false) {
            cell.checkBoxButton.isChecked = true
            cell.checkBoxButton.buttonClicked(sender: cell.checkBoxButton)
            rowsWhichAreChecked.append(indexPath)
        } else {
            cell.checkBoxButton.isChecked = false
            cell.checkBoxButton.buttonClicked(sender: cell.checkBoxButton)
            // remove the indexPath from rowsWhichAreCheckedArray
            if let checkedItemIndex = rowsWhichAreChecked.firstIndex(of: indexPath){
                rowsWhichAreChecked.remove(at: checkedItemIndex)
            }
        }
    }
}
