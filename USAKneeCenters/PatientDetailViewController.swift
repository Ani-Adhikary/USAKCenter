//
//  PatientDetailViewController.swift
//  USAKneeCenters
//
//  Created by Anindita Adhikary on 23/03/18.
//

import UIKit

class PatientDetailViewController: UIViewController {

    @IBOutlet weak var patientPlanTableView: UITableView!
    
    var plans = [
        PatientPlan(planTitle: "Physical Therapy", planCompletedDate: "Completed: 08-12-2017", planImage: "Heart"),
        PatientPlan(planTitle: "Visco Injections", planCompletedDate: "Completed: 08-12-2017", planImage: "Injection"),
        PatientPlan(planTitle: "Knee Brace", planCompletedDate: "Completed:", planImage: "Heart"),
        PatientPlan(planTitle: "Medications", planCompletedDate: "Completed:", planImage: "Medication"),
        PatientPlan(planTitle: "PRP Injections", planCompletedDate: "Completed:", planImage: "Injection"),
        PatientPlan(planTitle: "Home Therapy", planCompletedDate: "Completed:", planImage: "Heart")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.patientPlanTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        navigationItem.title = "My Patient"
    }

}

extension PatientDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let planCell = tableView.dequeueReusableCell(withIdentifier: "PatientPlanCell", for: indexPath) as! PlanTableViewCell
        
        let plan = plans[indexPath.row]
        planCell.planTitleLabel?.text = plan.planTitle
        planCell.planCompletedDateLabel.text = plan.planCompletedDate
        planCell.planImage.image = UIImage(named: plan.planImage)
        
        return planCell
    }
}
