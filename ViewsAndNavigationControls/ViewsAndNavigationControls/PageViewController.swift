//
//  PageViewController.swift
//  ViewsAndNavigationControls
//
//  Created by Brais Moure on 06/01/2020.
//  Copyright © 2020 MoureDev. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    private var myControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myGreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcGreen")
        let myPinkVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcPink")
        
        myControllers.append(myGreenVC)
        myControllers.append(myPinkVC)
        
        setViewControllers([myGreenVC], direction: .forward, animated: true, completion: nil)
        
        dataSource = self
    }

}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = myControllers.firstIndex(of: viewController)
        if index == 0 {
            return myControllers.last
        }
        return myControllers.first
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        let index = myControllers.firstIndex(of: viewController)
        if index == 0 {
            return myControllers.last
        }
        return myControllers.first
    }

}
