//
//  ViewController.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 06/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let loginValidationClass = LoginValidationClass();
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func validateUser(sender: AnyObject) {
        
        let usernameField = username.text
        let passwordField = password.text

        if usernameField != nil || passwordField != nil {
            let mainView:MainViewController = MainViewController()
            self.presentViewController(mainView, animated: false, completion: nil)
        }else{
            self.showAlert("", alertMessage: "Oops, please make sure you have the correct username and/or password!")
        }
        
    }
    
    private func showAlert(alertTitle: String, alertMessage: String){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

