//
//  RequestForLink.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 08/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class RequestForLink: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var requestBtn: UIButton!
    @IBOutlet weak var fieldContainer: UIView!
    
    var isKeyboardUp: Bool = false
    var keyboardHeight: CGFloat!
    
//    let uiClass = UIClass()
    
    var activity: UIActivityIndicatorView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Change UIButton properties
        fieldContainer.backgroundColor = UIColor(patternImage: UIImage(named:"image-pattern")!)
        self.requestBtn.backgroundColor = UIColor.whiteColor()
        self.requestBtn.layer.cornerRadius = 25.0
        self.requestBtn.clipsToBounds = true
        self.requestBtn.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        self.requestBtn.layer.shadowRadius = 3.0
        self.requestBtn.layer.shadowOpacity = 0.4
        self.requestBtn.layer.shadowColor = UIColor.darkGrayColor().CGColor
        self.requestBtn.layer.masksToBounds = false
        
        // This block will determines if keyboard is displayed
        self.keyboardListener()
    }

    
    // This is triggered by the send out button
    @IBAction func sendOutRequest(sender: AnyObject) {
        
        // Take the email on the textField
        let email = emailField.text
        
        // Pass thru regex for email validity
        if (self.validateEmail(email!) != false) {
            
            // Let's disable the button and load the activity indicator
            self.disableButton()
            
            // Call on sharedInstance to pass on the RequestClass - this class will initialize the Alamofire library
            LibraryAPI.sharedInstance.sendMagicLink(email!){ (status:Bool, errCode:Int) in
                
                // When the API call is done lets enable the button again
                self.enableButton()
                
                // IF Status returns TRUE present new view controller
                if status {

                    let linkSentView = UIStoryboard(name:"Login", bundle: nil).instantiateViewControllerWithIdentifier("linkSentView")
                    self.presentViewController(linkSentView, animated: true, completion: nil)
                }else{
                    //If status is false, I should create a shared instance for all the possible error return this will make everything in once place for easy debugging!
                    // Do an alert here
                    let alertResp = LibraryAPI.sharedInstance.messageResponseFromUrlCode(errCode)
                    self.showAlert(alertResp.title, alertMessage: alertResp.message)
                    
                }
            }
        }else{
            self.showAlert("Oops!", alertMessage: "That's not a valid email address!")
        }
    }
    
    func keyboardWillShow(sender: NSNotification){
        if !isKeyboardUp {
             if let keyboardRectValue = (sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() {
                UIView.animateWithDuration(0.3, animations: {
                    self.keyboardHeight       = keyboardRectValue.height
                    self.view.frame.origin.y -= keyboardRectValue.height
                })
            }
        }
        isKeyboardUp = true
    }
    
    func keyboardWillHide(){
        if isKeyboardUp {
            self.view.endEditing(true)
            UIView.animateWithDuration(0.3, animations: {
                self.view.frame.origin.y += self.keyboardHeight
            })
        }
        isKeyboardUp = false
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


// Creating an extension will segragate private functions with public ones
private extension RequestForLink{
    
    private func keyboardListener(){
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(keyboardWillShow(_:)), name:UIKeyboardDidShowNotification, object:nil)
        let dismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        self.view.addGestureRecognizer(dismissKeyboard)
    }
    
    private func showAlert(alertTitle: String, alertMessage: String){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    private func validateEmail(email: String) -> Bool?{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }


    private func enableButton(){
        self.requestBtn.enabled = true
        self.requestBtn.setTitle("SEND MAGIC LINK", forState: .Normal)
        self.activity.stopAnimating()
        self.activity.removeFromSuperview()
    }
    
    private func disableButton(){
        self.requestBtn.enabled     = false
        self.requestBtn.setTitle("", forState: .Normal)
        self.activity = UIActivityIndicatorView(activityIndicatorStyle:.WhiteLarge)
        self.activity.color = UIColor.grayColor()
        self.activity.frame = CGRectMake((self.view.frame.width / 2) - 20 , (self.requestBtn.frame.height / 2) - 10, 20, 20)
        self.activity.startAnimating()
        self.requestBtn.addSubview(activity)
    }
}
