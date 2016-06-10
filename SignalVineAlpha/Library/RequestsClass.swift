//
//  requestsClass.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 07/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit
import Foundation
import Alamofire


class RequestsClass: NSObject {

    
    func signalvineHandshake(){
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
                 .responseJSON{ response in
            
                    print(response.request)
                    print(response.response)
                    print(response.data)
                    print(response.result)
            
            
            }
        
    }
    
    func sendMagicLinkPost(email:String){
        
        let postData = ["magic_link": ["email": email]]
        
        //let headers = ["csrf-param" : "authenticity_token", "csrf-token": ""]
        
        //https://signalvine-magiclink-demo.appexpress.io/magic_links/magic_links
        Alamofire.request(.POST, "https://signalvine-magiclink-demo.appexpress.io/magic_links/", parameters: postData)
            .responseJSON{ response in
                
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
                
        }
    }
    
    func login(email:String, password:String)->String?{
        
        let response = "Logged In"
        
        return response
        
    }
    
    func shaEnc256(token: String?, secret: String?) -> String?
    {
//        let unprocessed = "\(secret)\(token)"
//        //guard
//            let data = unprocessed.dataUsingEncoding(NSUTF8StringEncoding)
//            let encData = shaEnc256(data)
//        //    else { return nil }
//        let encKey = encData.base64EncodedStringWithOptions([])
//        
//      
        let encKey = ""
        return encKey;
    }
}
