//
//  PatientsTableViewController.swift
//  USAKneeCenters
//
//  Created by Anindita Adhikary on 23/03/18.
//

import UIKit

class PatientsTableViewController: UIViewController {

    @IBOutlet weak var patientTable: UITableView!
    
    let patients = [
        Patient(patientName: "Jennifer Wright", patientDateOfBirth: "08-13-73"),
        Patient(patientName: "Michael Jordan", patientDateOfBirth: "08-17-69")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.patientTable.separatorStyle = UITableViewCell.SeparatorStyle.none
        navigationItem.title = "My Patients"
    }

}

extension PatientsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath) as! PatientTableViewCell
        let patient = patients[indexPath.row]
        cell.patientNameLabel.text = patient.patientName
        cell.patientDOBLabel.text = patient.patientDateOfBirth
        return cell
    } 
    
}
