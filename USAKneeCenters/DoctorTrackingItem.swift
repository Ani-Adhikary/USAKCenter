//
//  DoctorTrackingItem.swift
//  USAKneeCenters
//
//  Created by Anindita Adhikary on 23/03/18.
//

import Foundation

struct DoctorTrackingItem {
    
    let trackingItemImage: String
    let trackingItemName: String
    let trackingItemScreen: String
}

struct Patient {
    var patientName: String
    var patientDateOfBirth: String
}

struct PatientPlan {
    var planTitle: String
    var planCompletedDate: String
    var planImage: String
}
