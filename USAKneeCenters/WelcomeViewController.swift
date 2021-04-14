//
//  Welcome2ViewController.swift
//  UIPageViewController
//
//  Created by Anindita Adhikary on 22/02/18.
//  Copyright © 2018 Ani Adhikary. All rights reserved.
//

import UIKit

struct Plan {
    var planImage: String
    var planTitle: String
    var planDescription: String
}

// MARK: - WelcomeViewControllerDelegate
public protocol WelcomeViewControllerDelegate: class {
    func welcomeViewControllerCompleted(_ controller: WelcomeViewController)
}

public class WelcomeViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Injections
    public var welcomeDelegate: WelcomeViewControllerDelegate?

    var planPageViewController: UIPageViewController = UIPageViewController()
    
    let plans = [
        Plan(planImage: "USAKneeCenterMain", planTitle: "OUR PLAN >", planDescription: ""),
        Plan(planImage: "main-bg", planTitle: "DOCTORS", planDescription: "Our Physicians are fellowship trained knee specialists and are some of the top Doctors in their field."),
        Plan(planImage: "main-bg", planTitle: "COMPREHENSIVE", planDescription: "Our comprehensive program uses all clinically proven treatments currently available in the market."),
        Plan(planImage: "main-bg", planTitle: "TECHNOLOGY", planDescription: "We use the latest Technologies and non-surgical treatments to quickly reduce the pain found in the aging knee.")
    ]
    
//    Track the current index
//    var currentIndex: Int?
//    private var pendingIndex: Int?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Create the page container
        planPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        planPageViewController.delegate = self
        planPageViewController.dataSource = self
        planPageViewController.setViewControllers([getViewControllerAtIndex(index: 0)] as [UIViewController], direction: .forward, animated: true, completion: nil)
        
        // Add it to the view
        view.addSubview(planPageViewController.view)
        
        // Configure our custom pageControl
        view.bringSubviewToFront(pageControl)
        pageControl.numberOfPages = plans.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .blue
    }
    
    func getViewControllerAtIndex(index: Int) -> WelcomeContentViewController {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeContentView") as! WelcomeContentViewController
        
        let planValue = plans[index]
        pageContentViewController.plan = planValue.planTitle
        pageContentViewController.welcomeImage = planValue.planImage
        pageContentViewController.planDescription = planValue.planDescription
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
    
}

extension WelcomeViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent: WelcomeContentViewController = viewController as! WelcomeContentViewController
        var index = pageContent.pageIndex
        if ((index == 0) || (index == NSNotFound)) {
            return nil
        }
        
        index -= 1
        return getViewControllerAtIndex(index: index)
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent: WelcomeContentViewController = viewController as! WelcomeContentViewController
        var index = pageContent.pageIndex
        if (index == NSNotFound) {
            return nil
        }
        
        index += 1
        if (index == plans.count) {
            //print("End of Page View Controller reached")
            welcomeDelegate?.welcomeViewControllerCompleted(self)
            return nil
        }
        
        return getViewControllerAtIndex(index: index)
    }
    
    public func pageViewController(
        _ pageViewController: UIPageViewController,
        willTransitionTo pendingViewControllers:[UIViewController]) {
        if let itemController = pendingViewControllers[0] as? WelcomeContentViewController {
            self.pageControl.currentPage = itemController.pageIndex
        }
    }

}
    

