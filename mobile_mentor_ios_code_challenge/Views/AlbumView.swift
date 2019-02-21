//
//  AlbumController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Perez Willie Nwobu on 2/20/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation
import UIKit

class AlbumView: UIView {
    
    var albumImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    var albumNameLabel: UILabel = {
        return CreateUIElements().createUILabel(text: " ", textAlignment: .left, textColor: ColorPalette.MediumLightBlue.setHexColor(alpha: 1), fontName: Fonts.Bold.name(), fontSize: 27, lineBreakMode: .byTruncatingTail, backgroundColor: ColorPalette.Black.setHexColor(alpha: 0), borderWidth: 0, borderColor: ColorPalette.Black.setHexColor(alpha: 0))
    }()
    
    var artistLabel: UILabel = {
        return CreateUIElements().createUILabel(text: " ", textAlignment: .left, textColor: ColorPalette.White.setHexColor(alpha: 1), fontName: Fonts.Regular.name(), fontSize: 22, lineBreakMode: .byWordWrapping, backgroundColor: ColorPalette.Black.setHexColor(alpha: 0), borderWidth: 0, borderColor: ColorPalette.Black.setHexColor(alpha: 0))
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
        addSubview(albumImageView)
        addSubview(albumNameLabel)
        addSubview(artistLabel)
        setConstraints()
    }
    
    fileprivate func setConstraints() {
        
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        
          Constraints().constraintWithTopAndLeadingAnchor(field: albumImageView, width: 185, height: 215, topAnchor: topAnchor, topConstant: 25, leadingAnchor: leadingAnchor, leadingConstant: 25)
        
          Constraints().constraintWithTopAndLeadingAnchor(field: albumNameLabel, width: 170, height: 150, topAnchor: topAnchor, topConstant: 25, leadingAnchor: albumImageView.trailingAnchor, leadingConstant: 15)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: artistLabel, width: UIElementSizes.labelWidth - 125, height: 20, topAnchor: albumNameLabel.bottomAnchor, topConstant: 5, leadingAnchor: albumImageView.trailingAnchor, leadingConstant: 15)
        
//        Constraints().constraintWithCenterYAndCenterXAnchor(field: albumImageView, width: 100, height: 100, centerYAnchor: centerYAnchor, centerYConstant: 0, centerXAnchor: centerXAnchor, centerXConstant: 0)
     
    }
    
}
