//
//  DoctorTrackingViewController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 17/02/18.
//

import UIKit

class DoctorTrackingViewController: UIViewController {
    
    @IBOutlet weak var doctorTrackingItemTable: UITableView!
    
    let trackingItems = [
        DoctorTrackingItem(trackingItemImage: "my_set", trackingItemName: "My Patients", trackingItemScreen: "PatientTable"),
        DoctorTrackingItem(trackingItemImage: "setting-icons", trackingItemName: "Invite Patient", trackingItemScreen: "InvitePatientForm")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doctorTrackingItemTable.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    
    @IBAction func selectTrackingItem(_ sender: UIButton) {
        
    }
    
}

extension DoctorTrackingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackingCell", for: indexPath) as! DoctorTrackingTableViewCell
        let trackingItem = trackingItems[indexPath.row]
        cell.trackingImageView.image = UIImage(named: trackingItem.trackingItemImage)
        cell.trackingItemLabel.text = trackingItem.trackingItemName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trackingItem = trackingItems[indexPath.row]
        let vcName = trackingItem.trackingItemScreen
        let vc = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
