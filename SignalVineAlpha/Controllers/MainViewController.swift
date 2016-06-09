//
//  MainViewController.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 06/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("set tab here")
        //self.tabBarItem = UITabBarItem(tabBarSystemItem:"", tag: 1)
        //tabBar.setItems([tabBarItem], animated: false)
        //tabBar.barTintColor = UIColor.redColor()
        //self.tabBarController?.tabBarItem = UITabBarItem(title:"", image: UIImage(named: "profile-icon"), tag: 1)
        // Do any additional setup after loading the view.
        //tabBar.barTintColor = UIColor.redColor()
        self.tabBarItem = UITabBarItem(title: "Test", image: UIImage(named: "message-icon"), tag:1)
//        print(self.tabBarItem.tag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
