//
//  StringHelper.swift
//  iOSTest
//
//  Created by Fabrizio Sposetti on 05/06/2019.
//  Copyright © 2019 D&ATechnologies. All rights reserved.

import Foundation

protocol LocalizedEnum: CustomStringConvertible {}

class BundleMarker {}

extension LocalizedEnum where Self: RawRepresentable, Self.RawValue == String {
    var description: String {
        let tableName = "Strings"
        let bundle =  Bundle(for: BundleMarker.self)
        return NSLocalizedString(self.rawValue,
                                 tableName: tableName,
                                 bundle: bundle,
                                 value: "",
                                 comment: "")
    }
}

//extension StringProtocol {
//    var firstUppercased: String {
//        guard let first = first else { return "" }
//        return String(first).uppercased() + dropFirst()
//    }
//}

enum Text: String, LocalizedEnum {
    
    case Chat
    case ServerError
    case Login
    case UserName
    case Password
    case Animation
    case FadeIn
    case FadeOut
    case Error
    case CodingTasks
    case Email
    case password
    case UserOrPasswordIncorrect
    case Success
    case RequestDuration
    case Ok
    case Fail
    case EmptyFields
}

