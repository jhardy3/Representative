//
//  NetworkController.swift
//  Representatives
//
//  Created by Jake Hardy on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    
    
    // Fetch data at specific URL
    static func dataAtURL(url: NSURL, completion: (data: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print("Error in \(__FUNCTION__) - \(error.localizedDescription)")
                completion(data: nil)
            }
            completion(data: data)
        }
        dataTask.resume()
    }
}