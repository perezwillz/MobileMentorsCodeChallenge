//
//  LoginView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    var emailTextField: UITextField = {
        return CreateUIElements().createUITextField(placeHolderText: "email", borderWidth: 1, cornerRadius: 25, keyboardType: .emailAddress, contentVerticalAlignment: .center, textAlignment: .center, fontName: Fonts.Regular.name(), fontSize: 20, returnKeyType: .default)
    }()
    
  
    
    
    var passwordTextField: UITextField = {
        return CreateUIElements().createUITextField(placeHolderText: "password", borderWidth: 1, cornerRadius: 25, keyboardType: .alphabet, contentVerticalAlignment: .center, textAlignment: .center, fontName: Fonts.Regular.name(), fontSize: 20, returnKeyType: .default)
    }()
    
    var loginButton: UIButton = {
        return CreateUIElements().createUIButton(title: "LOGIN", fontName: Fonts.DemiBold.name(), fontSize: 35, borderWidth: 1)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    fileprivate func setupView() {
        
        backgroundColor = ColorPalette.DarkGray.setHexColor(alpha: 1)
        
        setLogoImageViewImage()
                addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
       
       setConstraints()

    }
    
    fileprivate func setLogoImageViewImage() {
        
        let image = UIImage(named: "logo_400x400")
        
        logoImageView.image = image
        
    }
    
    fileprivate func setConstraints() {
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
      
        
        Constraints().constraintWithTopAndCenterXAnchor(field: logoImageView, width: 150, height: 150, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarMaxY + 75, centerXAnchor: centerXAnchor, centerXConstant: 0)
      

        
      Constraints().constraintWithTopAndCenterXAnchor(field: emailTextField, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: logoImageView.bottomAnchor, topConstant: 25, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
      
      
    //Constraints().constraintWithCenterYAnchorOnly(field: emailTextField, centerYAnchor: centerYAnchor, centerYConstant: 0)
       
        Constraints().constraintWithTopAndCenterXAnchor(field: passwordTextField, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: emailTextField.bottomAnchor, topConstant: 15, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        Constraints().constraintWithTopAndCenterXAnchor(field: loginButton, width: UIElementSizes.buttonWidth, height: UIElementSizes.buttonHeight, topAnchor: passwordTextField.bottomAnchor, topConstant: 25, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
    }
    
}
