//
//  LibraryAPI.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 10/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    
    //Let's declare our class
    private let requestClass: RequestsClass
    private let errorMsgClass: ErrorClass
    private var userDetails: NSUserDefaults!
    // Mark: this will ensure a single instance is initialized
    
    // Method One of singleton approach - Apparently this is an old method
    class var sharedInstance: LibraryAPI{
        struct Singleton {
            static let instance = LibraryAPI()
        }
        return Singleton.instance
    }
    
    // Method Two of singleton Approach - This is new and most appropriate method
    // Commenting this still needs to make it work
//    class LibraryAPI {
//        static let sharedInstance = LibraryAPI()
//        private init(){}
//    }
    
    override init() {
        
        // This Class handles the POST/GET and JSON Reponse
        requestClass = RequestsClass()
        
        // This Class handles possible error messages thought out the App
        errorMsgClass = ErrorClass()
        
        // Data handling Class
        
        
        // NSUserdefaults
        userDetails = NSUserDefaults.standardUserDefaults()
        super.init()
    }

    /*
     // MARK: - RequestClass
     */
    
    // Method will send the Magic Link
    func sendMagicLink(email:String, completion:(status: Bool, errCode: Int)->Void){
        requestClass.sendMagicLinkPost(email){ (status: Bool, errCode:Int) in
            completion(status: status, errCode: errCode)
        }
    }

    
    
    /*
     // MARK: - ErrorClass
     */

    // This method will call on the string messages for error on response code
    func messageResponseFromUrlCode(code:Int)->(title:String, message:String){
         return errorMsgClass.messageResponseFromUrlCode(code)
    }
    
    
    
    
    
    /*
     // MARK: - NSUserdefaults
     // No separate class for this
     */
    
    func addUserData(data: String, keyname:String){
        self.userDetails.setObject(data, forKey: keyname)
    }
    
    func getUserDetails(keyname:String)->AnyObject{
        //print(self.userDetails.objectForKey(keyname))
        var returnObj: AnyObject = ""
        if self.userDetails.objectForKey(keyname) != nil {
            returnObj = self.userDetails.objectForKey(keyname)!
        }
        
        return returnObj
    }
    
}
