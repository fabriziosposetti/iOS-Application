//
//  LoginViewController.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take username and password input from the user using UITextFields
     *
     * 3) Using the following endpoint, make a request to login
     *    URL: http://dev.datechnologies.co/Tests/scripts/login.php
     *    Parameter One: email
     *    Parameter Two: password
     *
     * 4) A valid email is 'info@datechnologies.co'
     *    A valid password is 'Test123'
     *
     * 5) Calculate how long the API call took in milliseconds
     *
     * 6) If the response is an error display the error in a UIAlertView
     *
     * 7) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertView
     *
     * 8) When login is successful, tapping 'OK' in the UIAlertView should bring you back to the main menu.
     **/
    
    // MARK: - Properties
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Text.Login.description
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func setup() {
        userTextField.backgroundColor = UIColor.textFieldBackgroundColor()
        passwordTextField.backgroundColor = UIColor.textFieldBackgroundColor()

        passwordTextField.alpha = 0.8
        userTextField.setLeftPaddingPoints(CONSTANTS.TEXT_FIELD_LEFT_PADDING)
        passwordTextField.setLeftPaddingPoints(CONSTANTS.TEXT_FIELD_LEFT_PADDING)
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: Text.Password.description,
                                                               attributes: [NSAttributedString.Key.foregroundColor:
                                                                UIColor.placeHolderColor()])
        
        userTextField.attributedPlaceholder = NSAttributedString(string: Text.UserName.description,
                                                                     attributes: [NSAttributedString.Key.foregroundColor:
                                                                        UIColor.placeHolderColor()])
    }
    
    // MARK: - Actions

    @IBAction func buttonLoginPressed(_ sender: UIButton) {
        
        if validateForm() {
            showActivityIndicator(activityIndicator: activityIndicator)
            guard let viewModel = getLoginViewModel() else { return }
            DAO.instance.login(loginViewModel: viewModel) { [weak self] response, error, requestDuration in
                guard let self = self else { return }
                self.stopActivityIndicator(activityIndicator: self.activityIndicator)
                if error == nil, let message = response?.message, let requestDuration = requestDuration {
                    self.showLoginSucces(message: message, requestDuration: requestDuration)
                } else {
                    self.showLoginFail(message: error ?? "")
                }
            }
        } else {
            self.showToast(message: Text.EmptyFields.description, width: CONSTANTS.TOAST_SIZE)
        }
    }
    
    func getLoginViewModel() -> LoginViewModel? {
        guard let email = userTextField.text,
            let password = passwordTextField.text else { return nil }
        
        let loginViewModel = LoginViewModel(email: email, password: password)
        return loginViewModel
    }
    
    func showLoginSucces(message: String, requestDuration: String) {
        let alert = UIAlertController(title: Text.Success.description,
                                      message: message + "\n" + String.init(format: Text.RequestDuration.description,
                                                                            arguments: [requestDuration]),
                                      preferredStyle: .alert)
        
        let acept = UIAlertAction(title: Text.Ok.description,
                                  style: .default) { _ in
                                    self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(acept)
        self.present(alert, animated: false, completion: nil)
    }
    
    func showLoginFail(message: String) {
        let alert = UIAlertController(title: Text.Fail.description,
                                      message: message,
                                      preferredStyle: .alert)
        
        let acept = UIAlertAction(title: Text.Ok.description,
                                  style: .default,
                                  handler: nil)
        alert.addAction(acept)
        self.present(alert, animated: false, completion: nil)
    }
    
    func validateForm() -> Bool {
        if userTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            return false
        }
        return true
    }
    
}
