//
//  LoginViewModel.swift
//  iOSTest
//
//  Created by Fabrizio Sposetti on 05/06/2019.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation

class LoginViewModel {
    var email: String?
    var password: String?
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}
