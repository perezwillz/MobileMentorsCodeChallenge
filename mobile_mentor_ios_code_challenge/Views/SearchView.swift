//
//  SearchView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    var searchTextField: UITextField = {
        return CreateUIElements().createUITextField(placeHolderText: "enter artist/song name", borderWidth: 1, cornerRadius: 25, keyboardType: .alphabet, contentVerticalAlignment: .center, textAlignment: .center, fontName: Fonts.Regular.name(), fontSize: 20, returnKeyType: .default)
    }()
    
    var searchButton: UIButton = {
        return CreateUIElements().createUIButton(title: "Search", fontName: Fonts.DemiBold.name(), fontSize: 25, borderWidth: 1)
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
        addSubview(searchTextField)
        addSubview(searchButton)
        
        setConstraints()
        
    }
    
    fileprivate func setConstraints() {
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithTopAndCenterXAnchor(field: searchTextField, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarMaxY - 125, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        Constraints().constraintWithTopAndCenterXAnchor(field: searchButton, width: UIElementSizes.buttonWidth, height: UIElementSizes.buttonHeight, topAnchor: searchTextField.bottomAnchor, topConstant: 15, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
    }
    
}
