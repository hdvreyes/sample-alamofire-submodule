//
//  HomeViewController.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 08/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var token: UILabel!
    @IBOutlet weak var secret: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //tabBarItem = UITabBarItem(title:"Test", image: nil, tag: 1)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //self.navigationView.setNavigation((self.navigationController?.navigationBar)!)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let gToken = appDelegate.globalToken
        let gSecret = appDelegate.globalSecret
       
        token.text = "Token: \(gToken)"
        secret.text = "Secret: \(gSecret)"
        
    }

    private func test() {
        print("out")

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
