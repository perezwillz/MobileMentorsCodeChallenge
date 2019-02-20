//
//  LoginController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    let mainView: MainView = { return MainView() }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIElementSizes.navigationBarMaxY += navigationController!.navigationBar.frame.maxY
        
        setupUserAccounts()
        
        setupView()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       mainView.emailTextField.text = "jane.smith@email.com"
       mainView.passwordTextField.text = "test1234%^&*"
        handleLoginButtonTap(sender: mainView.loginButton)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupUserAccounts() {
        
        let defaultUsers = ["jane.smith@email.com", "john.doe@email.com"]
        let defaultUserPasswords = ["test1234%^&*", "*&^%4321tset"]
     
    UserAccountViewModel.userEmail = defaultUsers[0]
    UserAccountViewModel.userPassword = defaultUserPasswords[0]
    UserAccountViewModel().setUserDict()
    }
    
    fileprivate func setupView() {
         self.view.addSubview(mainView)
        let dismissKeyboardTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        dismissKeyboardTapGestureRecognizer.cancelsTouchesInView = false
        mainView.addGestureRecognizer(dismissKeyboardTapGestureRecognizer)
        mainView.loginButton.addTarget(self, action: #selector(handleLoginButtonTap(sender:)), for: .touchUpInside)
        mainView.emailTextField.delegate = self
      constrainMainView()
       
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //Here
    @objc func handleLoginButtonTap(sender: UIButton) {
        
        guard let emailAddress = mainView.emailTextField.text,
            let password = mainView.passwordTextField.text else { return }
        
        if let user = getUser(emailAddress: emailAddress) {
            guard let savedPassword = UserAccounts.userPasswords[user] else { return }
            comparePassword(password: password, savedPassword: savedPassword)
        } else {
            let alertController = CreateAlertController().withNoActions(title: "User Account Not Found", message: "The user account that you are attempting to use does not exist.")
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        }
    }
    
    fileprivate func getUser(emailAddress: String) -> Int? {
        var dictKey: Int?
        for item in UserAccounts.userAccountEmail {
            if item.value == emailAddress {
                dictKey = item.key
            }
        }
        return dictKey
    }
    
    fileprivate func comparePassword(password: String, savedPassword: String) {
        if password == savedPassword {
            let viewController = SearchViewController()
            let navController = UINavigationController(rootViewController: viewController)
            
            present(navController, animated: false, completion: nil)
        } else {
            let alertController = CreateAlertController().withCancelAction(title: "Incorrect Password", message: "Please re-enter your password and try again.")
            
            present(alertController, animated: true) {
                self.mainView.passwordTextField.text = ""
                self.mainView.passwordTextField.becomeFirstResponder()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }
    
    func constrainMainView(){
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: mainView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    }
    
}
