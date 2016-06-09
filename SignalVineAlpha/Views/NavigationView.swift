//
//  NavigationView.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 08/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class NavigationView: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the screen title
        navigationBar.topItem?.title = "Signal Vine"
        
        // Customize the button
        let rightButton = UIBarButtonItem()
        let rightBtn = UIButton()
        rightBtn.setImage(UIImage(named:"sendBtn.png"), forState: .Normal)
        rightBtn.frame = CGRectMake(0, 0, 30, 30)
        rightBtn.addTarget(self, action: #selector(NavigationView.test), forControlEvents: .TouchUpInside)
        rightButton.customView = rightBtn
        
        let leftButton = UIBarButtonItem()
        let leftBtn = UIButton()
        leftBtn.setImage(UIImage(named: "preferencesBtn.png"), forState: .Normal)
        leftBtn.frame = CGRectMake(0, 0, 35, 35)
        leftBtn.addTarget(self, action: #selector(NavigationView.test), forControlEvents: .TouchUpInside)
        leftButton.customView = leftBtn
        
        navigationBar.topItem?.rightBarButtonItem = rightButton
        navigationBar.topItem?.leftBarButtonItem = leftButton
        
//        navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(rightBtn, target: self, action: #selector(NavigationView.test))
        //self.topViewController?.navigationController?.navigationBar.barTintColor = UIColor.lightGrayColor()
    }
    
    func test() {
        print("Hello")
    }
}
