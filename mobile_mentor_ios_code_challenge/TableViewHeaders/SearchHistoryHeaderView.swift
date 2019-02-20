//
//  SearchHistoryHeaderView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class SearchHistoryHeaderView: UITableViewHeaderFooterView {
    
    var searchHistoryLabel: UILabel = {
        return CreateUIElements().createUILabel(text: "Search History", textAlignment: .center, textColor: ColorPalette.White.setHexColor(alpha: 1), fontName: Fonts.DemiBold.name(), fontSize: 15, lineBreakMode: .byWordWrapping, backgroundColor: ColorPalette.BaseRed.setHexColor(alpha: 0.85), borderWidth: 0, borderColor: ColorPalette.Black.setHexColor(alpha: 0))
    }()
    
    var clearHistoryButton: UIButton = {
        return CreateUIElements().createUIButton(title: "Clear", fontName: Fonts.Bold.name(), fontSize: 10, borderWidth: 0)
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    fileprivate func setupView() {
        addSubview(searchHistoryLabel)
        addSubview(clearHistoryButton)
        
        setConstraints()
    }
    
    fileprivate func setConstraints() {
        searchHistoryLabel.translatesAutoresizingMaskIntoConstraints = false
        clearHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithCenterYAndCenterXAnchor(field: searchHistoryLabel, width: UIElementSizes.windowWidth, height: 25, centerYAnchor: centerYAnchor, centerYConstant: 0, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        Constraints().constraintWithCenterYAnchorAndTrailing(field: clearHistoryButton, width: 50, height: UIElementSizes.buttonHeight, centerYAnchor: centerYAnchor, centerYConstant: 0, trailingAnchor: trailingAnchor, trailingConstant: -10)
    }
    
}
