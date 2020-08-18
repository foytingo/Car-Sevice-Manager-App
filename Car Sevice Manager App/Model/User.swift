//
//  User.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 18.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import Foundation

struct User {
    
    var uid: String?
    var name: String
    var email: String
    var cars: [String] = []
    var appointments: [String] = []
    
    
    init(name: String, email: String, uid: String? = nil) {
        self.name = name
        self.email = email
    }
    
    
    init(uid: String, dictionary: [String:Any]) {
        self.uid = uid
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.cars = dictionary["cars"] as? [String] ?? []
        self.appointments = dictionary["appointment"] as? [String] ?? []
    }
    
    
}
