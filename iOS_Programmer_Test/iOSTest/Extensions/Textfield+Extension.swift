//
//  Textfield+Extension.swift
//  iOSTest
//
//  Created by Fabrizio Sposetti on 04/06/2019.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
