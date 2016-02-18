//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Jake Hardy on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

// http://whoismyrepresentative.com/getall_reps_bystate.php?state=CA&output=json

class RepresentativeController {
    
    static private let BASE_URL = "http://whoismyrepresentative.com/getall_reps_bystate.php?state="
    static private let END_URL = "&output=json"
    
    var representativeArray = [Representative]()
    
    
    // IF THERE IS AN ERROR IT IS GOING TO BE IN HERE SOMEWHERE
    
    static func getRepresentativesFor(state state: String, completion: (representativeArray: [Representative]) -> Void) {
        let soonToBeURL = BASE_URL + state + END_URL
        let URL = NSURL(string: String(soonToBeURL))!
        NetworkController.dataAtURL(URL) { (data) -> Void in
            if let data = data {
                do {
                    let jsonObject = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                    if let jsonDictionary = jsonObject as? [String : AnyObject], let representativesArray = jsonDictionary["results"] as? [[String : String]] {
                        var repsArray = [Representative]()
                        for representative in representativesArray {
                            if let rep = Representative(jsonDictionary: representative) {
                                repsArray.append(rep)
                            }
                        }
                        completion(representativeArray: repsArray)
                    }
                } catch {
                    completion(representativeArray: [])
                }
            } else {
                completion(representativeArray: [])
            }
        }
    }
    
}