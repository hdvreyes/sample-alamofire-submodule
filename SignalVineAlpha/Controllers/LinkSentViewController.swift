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
    @IBOutlet weak var linkSentHeading: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bodyContainer.backgroundColor = UIColor(patternImage: UIImage(named: "image-pattern")!)
        // Sets the button property
        self.appLinkBtn.backgroundColor     = UIColor.whiteColor()
        self.appLinkBtn.layer.cornerRadius  = 25.0
        self.appLinkBtn.layer.shadowOffset  = CGSize(width: 0, height: 3.0)
        self.appLinkBtn.layer.shadowRadius  = 3.0
        self.appLinkBtn.layer.shadowOpacity = 0.4
        self.appLinkBtn.layer.shadowColor   = UIColor.darkGrayColor().CGColor
        self.appLinkBtn.layer.masksToBounds = false
        
        let attributedString = NSMutableAttributedString(string: self.linkSentHeading.text!)
        
        attributedString.addAttribute(NSKernAttributeName, value: CGFloat(1.4), range: NSRange(location: 0, length: 16))
        self.linkSentHeading.attributedText = attributedString
        
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
