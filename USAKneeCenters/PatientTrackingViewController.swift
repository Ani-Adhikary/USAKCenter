//
//  PatientTrackingViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 26/03/18.
//

import UIKit

class PatientTrackingViewController: UIViewController {

    @IBOutlet weak var patientTrackingTable: UITableView!
    
    var tracks = [
        PatientTrackingItem(trackNumber: "1", trackItem: "Bending down to pick something up:"),
        PatientTrackingItem(trackNumber: "2", trackItem: "Standing up after a few hours:"),
        PatientTrackingItem(trackNumber: "3", trackItem: "Rolling over in bed at night:"),
        PatientTrackingItem(trackNumber: "4", trackItem: "Walking outside to get the mail:"),
        PatientTrackingItem(trackNumber: "5", trackItem: "Walking down the stairs:"),
        PatientTrackingItem(trackNumber: "6", trackItem: "Getting in and out of my car or truck:")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.patientTrackingTable.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

}

extension PatientTrackingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientTrackCell", for: indexPath) as! PatientTrackingTableViewCell
        
        let track = tracks[indexPath.row]
        cell.trackNumber.text = track.trackNumber
        cell.trackItemLabel.text = track.trackItem
        return cell
    }
}
