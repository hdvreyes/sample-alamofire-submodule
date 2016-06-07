//
//  SampleData.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 06/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class SampleData: NSObject {

    var messages        = [NSArray]()
    var messageContents = [NSArray]()
    override init() {
        super.init()
        messages        = []
        messageContents = []
    }
    
    static func fetchMessage(){
            
    }
    
}
