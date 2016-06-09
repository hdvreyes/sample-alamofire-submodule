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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Change UIButton properties
        fieldContainer.backgroundColor = UIColor(patternImage: UIImage(named:"image-pattern")!)
        self.requestBtn.backgroundColor = UIColor.whiteColor()
        self.requestBtn.layer.cornerRadius = 25.0
        self.requestBtn.clipsToBounds = true
        self.requestBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.requestBtn.layer.shadowRadius = 3.0
        
        // This block will determines if keyboard is displayed
        self.keyboardListener()
    }

    private func keyboardListener(){
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(keyboardWillShow(_:)), name:UIKeyboardDidShowNotification, object:nil)
        let dismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        self.view.addGestureRecognizer(dismissKeyboard)
    }
    
    
    @IBAction func sendOutRequest(sender: AnyObject) {
        
        let email = emailField.text
        
        // Checks for valid email - HMMMMM, i think i made some redundancy here.
        if (self.validateEmail(email!) != false) {
            
            let requestClass = RequestsClass()
            requestClass.sendMagicLinkPost(email!)
            print("Here")
            let linkSentView = UIStoryboard(name:"Login", bundle: nil).instantiateViewControllerWithIdentifier("linkSentView") 
            
            print(linkSentView)
            //self.navigationController?.presentViewController(linkSentView, animated: true, completion: nil)
            self.presentViewController(linkSentView, animated: true, completion: nil)
            //self.navigationController?.pushViewController(linkSentView, animated: true)
        }else{
            self.showAlert("Awe!", alertMessage: "That's not a valid email address!")
        }
    }
    
    private func validateEmail(email: String) -> Bool?{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
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
