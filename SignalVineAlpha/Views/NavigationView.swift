//
//  NavigationView.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 08/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class NavigationView: UINavigationController {

    
    func setNavigation(navigation: UINavigationBar) {
        navigation.tintColor = UIColor.whiteColor()
        //navigation.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector(test()))
        self.navigationController?.title = "Hello"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(NavigationView.test))
        let right = self.navigationItem
        navigation.items = [right]
    }
    
    func test() {
        print("Hello")
    }
}
