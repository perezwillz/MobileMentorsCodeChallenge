//
//  CreateUIElements.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class CreateUIElements {
    
    func createNavigationBarTeamView(text: String) -> UIView {
        let navigationBarTeamView: UIView = {
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
            
            return view
        }()
        
        let selectedTeamLabel: UILabel = {
            return createUILabel(text: "", textAlignment: .center, textColor: ColorPalette.White.setHexColor(alpha: 1), fontName: Fonts.DemiBold.name(), fontSize: 20, lineBreakMode: .byWordWrapping, backgroundColor: ColorPalette.Black.setHexColor(alpha: 0), borderWidth: 0, borderColor: ColorPalette.Black.setHexColor(alpha: 0))
        }()
        
        let searchTextField: UITextField = {
            return CreateUIElements().createUITextField(placeHolderText: "search for...", borderWidth: 0, cornerRadius: 25, keyboardType: .alphabet, contentVerticalAlignment: .center, textAlignment: .center, fontName: Fonts.Regular.name(), fontSize: 15, returnKeyType: .default)
        }()
        
        selectedTeamLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        selectedTeamLabel.text = text
        
        searchTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        searchTextField.isHidden = true
        
        navigationBarTeamView.addSubview(selectedTeamLabel)
        navigationBarTeamView.addSubview(searchTextField)
        
        return navigationBarTeamView
        
    }
    
    func createUIView() -> UIView {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        //        view.tag = SetTagID().setTagID()
        view.backgroundColor = .black
        return view
    }
    
    func createUILabel(text: String, textAlignment: NSTextAlignment, textColor: UIColor, fontName: String, fontSize: CGFloat, lineBreakMode: NSLineBreakMode, backgroundColor: UIColor, borderWidth: CGFloat, borderColor: UIColor) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.textAlignment = textAlignment
        label.textColor = textColor
        label.font = UIFont(name: fontName, size: fontSize)
        label.backgroundColor = backgroundColor
        label.layer.borderWidth = borderWidth
        label.layer.borderColor = borderColor.cgColor
        label.numberOfLines = 0
        label.lineBreakMode = lineBreakMode
        
        return label
        
    }
    
    func createUITextField(placeHolderText: String, borderWidth: CGFloat, cornerRadius: CGFloat, keyboardType: UIKeyboardType, contentVerticalAlignment: UIControl.ContentVerticalAlignment, textAlignment: NSTextAlignment, fontName: String, fontSize: CGFloat, returnKeyType: UIReturnKeyType) -> UITextField {
        
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "*\(placeHolderText)*", attributes: [NSAttributedString.Key.foregroundColor: ColorPalette.White.setHexColor(alpha: 0.5)])
        textField.backgroundColor = ColorPalette.MediumDarkBlue.setHexColor(alpha: 1)
        textField.layer.borderColor = ColorPalette.MediumLightBlue.setHexColor(alpha: 1).cgColor
        textField.layer.borderWidth = borderWidth
        textField.layer.cornerRadius = cornerRadius
        textField.borderStyle = .line
        textField.keyboardType = keyboardType
        textField.contentVerticalAlignment = contentVerticalAlignment
        textField.textAlignment = textAlignment
        textField.textColor = ColorPalette.White.setHexColor(alpha: 1)
        textField.font = UIFont(name: fontName, size: fontSize)
        textField.borderStyle = .none
        textField.layer.shadowColor = ColorPalette.Black.setHexColor(alpha: 0.55).cgColor
        textField.layer.shadowRadius = 5
        textField.layer.shadowOffset = CGSize(width: 0, height: 3)
        textField.layer.shadowOpacity = 1
        textField.layer.masksToBounds = true
        
        
        textField.isUserInteractionEnabled = true
        textField.isEnabled = true
        
        return textField
        
    }
    
    func createUISegmentedControl(items: [String], tintColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat, isDynamic: Bool, row: Int, loopCount: Int) -> UISegmentedControl {
        
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.tintColor = tintColor
        segmentedControl.backgroundColor = backgroundColor
        segmentedControl.layer.cornerRadius = cornerRadius
        
        if isDynamic {
            segmentedControl.tag = (row + 1) * 10000 + loopCount
            segmentedControl.frame = CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width / 3 - 20, height: 15)
        }
        
        segmentedControl.isUserInteractionEnabled = true
        
        return segmentedControl
        
    }
    
    func createUIDatePicker(datePickerMode: UIDatePicker.Mode, borderWidth: CGFloat, borderColor: UIColor, tintColor: UIColor, textColor: UIColor) -> UIDatePicker {
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = datePickerMode
        datePicker.layer.borderWidth = borderWidth
        datePicker.layer.borderColor = borderColor.cgColor
        datePicker.tintColor = tintColor
        datePicker.setValue(textColor, forKey: "textColor")
        
        return datePicker
        
    }
    
    func createUIPickerView(borderWidth: CGFloat, borderColor: UIColor, tintColor: UIColor, textColor: UIColor) -> UIPickerView {
        
        let pickerView = UIPickerView()
        pickerView.layer.borderWidth = borderWidth
        pickerView.layer.borderColor = borderColor.cgColor
        pickerView.tintColor = tintColor
        pickerView.setValue(textColor, forKey: "textColor")
        
        return pickerView
        
    }
    
    func createUIButton(title: String, fontName: String, fontSize: CGFloat, borderWidth: CGFloat) -> UIButton {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel!.font = UIFont(name: fontName, size: fontSize)
        button.setTitleColor(ColorPalette.LightBlue.setHexColor(alpha: 1), for: .normal)
        button.backgroundColor = ColorPalette.MediumDarkBlue.setHexColor(alpha: 0)
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = ColorPalette.LightBlue.setHexColor(alpha: 0).cgColor
        
        return button
        
    }
    
    func createUIButtonWithImage(title: String, fontName: String, fontSize: CGFloat, titleColor: UIColor, backgroundColor: UIColor, borderWidth: CGFloat, borderColor: UIColor) -> UIButton {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel!.font = UIFont(name: fontName, size: fontSize)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        
        return button
        
    }
    
}
