//
//  MainTabBarController.swift
//  USAKneeCenters
//
//  Created by Ani Adhikary on 25/03/18.
//

import UIKit

class MainTabBarController: UITabBarController {

    var userType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupTabBar() {
        
        guard let userTypeVal = userType else {
            return
        }
        
        var planNavigationController = UserPlanNavigationController()
        let storyboard1 = UIStoryboard(name: "Plan", bundle: nil)
        planNavigationController = storyboard1.instantiateViewController(withIdentifier: "NavigationPlan") as! UserPlanNavigationController
        
        planNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Home")
        planNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "Home_Selected")
        planNavigationController.tabBarItem.title = "Plan"
        
        var trackingNavigationController = UIViewController()
        
        if userTypeVal == "d" {
            let storyboard2 = UIStoryboard(name: "Tracking", bundle: nil)
            trackingNavigationController = storyboard2.instantiateViewController(withIdentifier: "NavigationTracking") as! DoctorTrackingNavigationController
        } else if userTypeVal == "p" {
            let storyboard = UIStoryboard(name: "TrackingPatient", bundle: nil)
            trackingNavigationController = storyboard.instantiateViewController(withIdentifier: "NavigationPatientTracking") as! PatientTrackingNavigationController
        }
        
        trackingNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Activity")
        trackingNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "Activity_Selected")
        trackingNavigationController.tabBarItem.title = "Track"
        
        var educationNavigationController = EducationNavigationController()
        let storyboard3 = UIStoryboard(name: "Education", bundle: nil)
        educationNavigationController = storyboard3.instantiateViewController(withIdentifier: "NavigationEducation") as! EducationNavigationController
        
        educationNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Search")
        educationNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "Search_Selected")
        educationNavigationController.tabBarItem.title = "Edu"
        
        var profileNavigationController = ProfileNavigationController()
        let storyboard4 = UIStoryboard(name: "Profile", bundle: nil)
        profileNavigationController = storyboard4.instantiateViewController(withIdentifier: "NavigationProfile") as! ProfileNavigationController
        
        profileNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Profile")
        profileNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "Profile_Selected")
        profileNavigationController.tabBarItem.title = "Me"
        
        if userTypeVal == "d" {
            viewControllers = [trackingNavigationController, educationNavigationController, profileNavigationController]
        } else if userTypeVal == "p" {
            viewControllers = [planNavigationController, trackingNavigationController, educationNavigationController, profileNavigationController]
        }
    }
}
