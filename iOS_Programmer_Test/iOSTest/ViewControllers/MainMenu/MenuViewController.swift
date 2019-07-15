//
//  MenuViewController.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     *
     * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
     *
     * 2) Use Autolayout to make sure all UI works for each resolution
     *
     * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
     *    provided code if necessary. It is ok to add any classes. This is your project now!
     *
     * 4) Read the additional instructions comments throughout the codebase, they will guide you.
     *
     * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
     *
     * Thank you and Good luck. - D & A Technologies
     * =========================================================================================
     */
    
    // MARK: - Outlets
    @IBOutlet weak var viewChatButton: UIView!
    @IBOutlet weak var viewLoginButton: UIView!
    @IBOutlet weak var viewAnimationButton: UIView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Text.CodingTasks.description
        setup()
    }
    
    private func setup() {
        self.viewChatButton.layer.cornerRadius = 8
        self.viewLoginButton.layer.cornerRadius = 8
        self.viewAnimationButton.layer.cornerRadius = 8
    }
    
}
