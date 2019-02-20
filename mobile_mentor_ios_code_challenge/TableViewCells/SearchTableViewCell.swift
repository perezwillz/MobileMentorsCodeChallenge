//
//  SearchTableViewCell.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Gregory Omoma on 2/17/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation
import UIKit

class SearchTableViewCell : UITableViewCell {
    
    let searchTermLabel: UILabel = {
        return CreateUIElements().createUILabel(text: "", textAlignment: .left, textColor: ColorPalette.BaseBlue.setHexColor(alpha: 1), fontName: Fonts.Regular.name(), fontSize: 15, lineBreakMode: .byWordWrapping, backgroundColor: ColorPalette.Black.setHexColor(alpha: 0), borderWidth: 0, borderColor: ColorPalette.Black.setHexColor(alpha: 0))
    }()
    
    let dateLabel: UILabel = {
        return CreateUIElements().createUILabel(text: "", textAlignment: .right, textColor: ColorPalette.BaseBlue.setHexColor(alpha: 1), fontName: Fonts.Regular.name(), fontSize: 15, lineBreakMode: .byWordWrapping, backgroundColor: ColorPalette.Black.setHexColor(alpha: 0), borderWidth: 0, borderColor: ColorPalette.Black.setHexColor(alpha: 0))
    }()
    
  
    
    func setup(){
        addSubview(searchTermLabel)
        addSubview(dateLabel)
        
        searchTermLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithCenterYAnchorAndLeading(field: searchTermLabel, width: UIElementSizes.windowWidth / 2 - 10, height: 50, centerYAnchor: centerYAnchor, centerYConstant: 0, leadingAnchor: leadingAnchor, leadingConstant: 5)
        
        Constraints().constraintWithCenterYAnchorAndLeading(field: dateLabel, width: UIElementSizes.windowWidth / 2 - 10, height: 50, centerYAnchor: centerYAnchor, centerYConstant: 0, leadingAnchor: trailingAnchor, leadingConstant: -UIElementSizes.windowWidth / 2 + 5)
    }
    
    override init(style : UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
