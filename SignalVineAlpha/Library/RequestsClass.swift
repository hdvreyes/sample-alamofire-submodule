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

    
    func signalvineHandshake(email:String, completion:(status:Bool, errCode: String)->Void){
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
                 .responseJSON{ response in
                    //print(response.request)
                    //print(response.response)
                    //print(response.data)
                    //print(response.result.error)
                    
                    if response.result.error != nil{
                        completion(status: false, errCode: "\(response.response!.statusCode)")
                    }else{
                        completion(status: true, errCode: "\(response.response!.statusCode)")
                    }
            }
        
    }
    
    func sendMagicLinkPost(email:String, completion:(status:Bool, errCode:Int)->Void){
        
        let postData = ["magic_link": ["email": email]]
        //https://signalvine-magiclink-demo.appexpress.io/magic_links/magic_links
        Alamofire.request(.POST, "https://signalvine-magiclink-demo.appexpress.io/magic_links/", parameters: postData)
            .responseJSON{ response in
//                print(response.request)
//                print(response.response)
//                print(response.data)
                if response.response!.statusCode != 200{
                    completion(status: false, errCode: response.response!.statusCode)
                }else{
                    completion(status: true, errCode: response.response!.statusCode)
                }
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
