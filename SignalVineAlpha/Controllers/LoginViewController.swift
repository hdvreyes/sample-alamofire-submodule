//
//  LoginViewController.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 06/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signginBtn: UIButton!
    @IBOutlet weak var textFieldContainer: UIView!
    
    
    let uiClass = UIClass();
    var isKeyboardUp: Bool = false
    var keyboardHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(LoginViewController.keyboardWillShow(_:)), name:UIKeyboardDidShowNotification, object:nil)
        let dismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        self.view.addGestureRecognizer(dismissKeyboard)
        
    }

    @IBAction func signIn(sender: AnyObject) {
        
        let urlRquest   = RequestsClass()
        let emailC       = emailField.text!
        let passwordC    = passwordField.text!
        
        
        
        
        if let status = urlRquest.login(emailC, password: passwordC) {
            print(status)
        }
    }
    
    func keyboardWillShow(sender:NSNotification){
        
//        let keyboardInfo:NSDictionary = sender.userInfo!
//        let keyboardFrame:NSValue = keyboardInfo.valueForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
//        let keyboardRectangle = keyboardFrame.CGRectValue()
//        let keyboardHeight = keyboardRectangle.height
        
        if !isKeyboardUp {
            print(isKeyboardUp)
            if let keyboardRectValue = (sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() {
                UIView.animateWithDuration(0.3, animations:{
                    self.keyboardHeight = keyboardRectValue.height
                    self.view.frame.origin.y -= keyboardRectValue.height
                })
            }
        }
        isKeyboardUp = true
    }
    
    func keyboardWillHide()
    {
        if isKeyboardUp {
            self.view.endEditing(true)
            
            UIView.animateWithDuration(0.3, animations:{
                //                self.view.frame = CGRectMake(self.view.layer.position.x, self.view.layer.position.y-keyboardHeight, self.view.frame.size.width, self.view.frame.size.height)
                self.view.frame.origin.y += self.keyboardHeight
            })
        }
        
        isKeyboardUp = false
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
