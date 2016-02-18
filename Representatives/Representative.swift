//
//  Representative.swift
//  Representatives
//
//  Created by Jake Hardy on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


struct Representative {
    
    // MARK: - Init Keys
    
    private let kName = "name"
    private let kParty = "party"
    private let kState = "state"
    private let kDistrict = "district"
    private let kPhone = "phone"
    private let kOffice = "office"
    private let kLink = "link"
    
    // MARK: - Properties
    
    var name: String = ""
    var party: String = ""
    var state: String = ""
    var district: String = ""
    var phone: String = ""
    var office: String = ""
    var link: String = ""
    
    init?(jsonDictionary: [String : String]) {
        guard let name = jsonDictionary[kName],
            let party = jsonDictionary[kParty],
            let state = jsonDictionary[kState],
            let district = jsonDictionary[kDistrict],
            let phone = jsonDictionary[kPhone],
            let office = jsonDictionary[kOffice],
            let link = jsonDictionary[kLink]
            else { return nil }
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
    
    
}