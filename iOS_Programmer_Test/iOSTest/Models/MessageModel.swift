//
//  Message.swift
//  iOSTest
//
//  Created by Fabrizio Sposetti on 04/06/2019.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation

class MessageModel: Codable {
    let user_id: String?
    let name: String?
    let avatar_url: String?
    let message: String?
}
