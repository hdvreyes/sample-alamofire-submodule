//
//  LinkSentView.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 09/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class LinkSentViewController: UIViewController {

    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var appLinkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bodyContainer.backgroundColor = UIColor(patternImage: UIImage(named: "image-pattern")!)
        // Sets the button property
        self.appLinkBtn.backgroundColor     = UIColor.whiteColor()
        self.appLinkBtn.layer.cornerRadius  = 25.0
    }
    
    @IBAction func openMailApp(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string:"googlegmail://")!)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
