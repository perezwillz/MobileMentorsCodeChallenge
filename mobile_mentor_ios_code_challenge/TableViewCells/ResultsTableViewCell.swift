//
//  ResultsTableViewCell.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    
    var albumImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    var trackLabel: UILabel = {
        return CreateUIElements().createUILabel(text: "", textAlignment: .left, textColor: ColorPalette.MediumLightBlue.setHexColor(alpha: 1), fontName: Fonts.Bold.name(), fontSize: 20, lineBreakMode: .byWordWrapping, backgroundColor: ColorPalette.Black.setHexColor(alpha: 0), borderWidth: 0, borderColor: ColorPalette.Black.setHexColor(alpha: 0))
    }()
    
    var albumLabel: UILabel = {
        return CreateUIElements().createUILabel(text: "", textAlignment: .left, textColor: ColorPalette.MediumLightBlue.setHexColor(alpha: 1), fontName: Fonts.Regular.name(), fontSize: 15, lineBreakMode: .byWordWrapping, backgroundColor: ColorPalette.Black.setHexColor(alpha: 0), borderWidth: 0, borderColor: ColorPalette.Black.setHexColor(alpha: 0))
    }()
    
    var artistLabel: UILabel = {
        return CreateUIElements().createUILabel(text: "", textAlignment: .left, textColor: ColorPalette.BaseBlue.setHexColor(alpha: 1), fontName: Fonts.Regular.name(), fontSize: 15, lineBreakMode: .byWordWrapping, backgroundColor: ColorPalette.Black.setHexColor(alpha: 0), borderWidth: 0, borderColor: ColorPalette.Black.setHexColor(alpha: 0))
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        fatalError("init(coder:) has not been implemented")
        
    }
    
    fileprivate func setupView() {
        
        backgroundColor = ColorPalette.DarkGray.setHexColor(alpha: 1)
        
        addSubview(albumImageView)
        setConstraints()
        
    }
    
    fileprivate func setConstraints() {
        
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        trackLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        Constraints().constraintWithTopAndLeadingAnchor(field: albumImageView, width: 100, height: 100, topAnchor: topAnchor, topConstant: 25, leadingAnchor: leadingAnchor, leadingConstant: 25)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: trackLabel, width: UIElementSizes.labelWidth - 125, height: 30, topAnchor: topAnchor, topConstant: 25, leadingAnchor: albumImageView.trailingAnchor, leadingConstant: 15)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: albumLabel, width: UIElementSizes.labelWidth - 125, height: 20, topAnchor: trackLabel.bottomAnchor, topConstant: -5, leadingAnchor: albumImageView.trailingAnchor, leadingConstant: 15)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: artistLabel, width: UIElementSizes.labelWidth - 125, height: 25, topAnchor: albumLabel.bottomAnchor, topConstant: 0, leadingAnchor: albumImageView.trailingAnchor, leadingConstant: 15)
        
    }
    
}
