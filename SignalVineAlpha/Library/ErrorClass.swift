//
//  ErrorClass.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 13/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class ErrorClass: NSObject {
    
    let heading = "Oops!"
    
    // #Mark - URL REQUEST CODE Error Message
    
    //This method will return String values based on url reponse code
    func messageResponseFromUrlCode(code:Int)->(title:String, message:String){
        var message = ""
        switch code {
        case 200:
//            completion(message: "It's a success!")
            message = "It's as success!"
            break
        case 201...550:
//            completion(message: "Our server is probably busy at the moment. Kindly try again in a few!")
            message = "Our server is probably busy at the moment. Kindly try again in a few!"
            break
        default:
            break
        }
        
        return (self.heading, message)
    }
    
    
    // #Mark - System Wide Message
    func messageResponseFromSystem(code:Int)->(title:String, message:String){
        
        let message = ""
        
        return (heading, message)
        
    }
    
    
    
}
