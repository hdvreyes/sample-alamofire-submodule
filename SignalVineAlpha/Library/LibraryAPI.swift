//
//  LibraryAPI.swift
//  SignalVineAlpha
//
//  Created by Habagat Reyes on 10/06/2016.
//  Copyright © 2016 Habagat Reyes. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    
    // Mark: this will ensure a single instance is initialized
    class var sharedInstance: LibraryAPI{
        struct Singleton {
            static let instance = LibraryAPI()
        }
        return Singleton.instance
    }
    


}
