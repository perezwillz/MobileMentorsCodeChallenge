//
//  ColorPalette.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

enum ColorPalette {
    case White, Black, LightGray, MediumLightGray, BaseGray, MediumDarkGray, DarkGray, LightBlue, MediumLightBlue, BaseBlue, MediumDarkBlue, DarkBlue, LightGreen, MediumLightGreen, BaseGreen, MediumDarkGreen, DarkGreen, lightYellow, MediumLightYellow, BaseYellow, DarkYellow, lightOrange, MediumLightOrange, BaseOrange, DarkOrange, LightRed, MediumLightRed, BaseRed, MediumDarkRed, DarkRed
    
    fileprivate func setColor(hexString: String, alpha: CGFloat) -> UIColor {
        
        return UIColor().HexToColor(hexString: hexString, alpha: alpha)
        
    }
    
    func setHexColor(alpha: CGFloat) -> UIColor {
        
        var hexString: String
        
        switch self {
        case .White: hexString = "#FFFFFF"
        case .Black: hexString = "#000000"
            
        case .LightGray: hexString = "#ABAFB0"
        case .MediumLightGray: hexString = "#80888B"
        case .BaseGray: hexString = "#636E72"
        case .MediumDarkGray: hexString = "#4A575C"
        case .DarkGray: hexString = "#323F44"
            
        case .LightBlue: hexString = "#50A3E3"
        case .MediumLightBlue: hexString = "#2590E3"
        case .BaseBlue: hexString = "#0984E3"
        case .MediumDarkBlue: hexString = "#0463AC"
        case .DarkBlue: hexString = "#034B82"
            
        case .LightGreen: hexString = "#46E7A2"
        case .MediumLightGreen: hexString = "#18E78E"
        case .BaseGreen: hexString = "#00E683"
        case .MediumDarkGreen: hexString = "#00B668"
        case .DarkGreen: hexString = "#008B4F"
            
        case .lightYellow: hexString = "#FFD34E"
        case .MediumLightYellow: hexString = "#FFC61A"
        case .BaseYellow: hexString = "#FFBF00"
        //    case MediumDarkYellow = "#F3BD20"
        case .DarkYellow: hexString = "#CB9800"
            
        case .lightOrange: hexString = "#FF804E"
        case .MediumLightOrange: hexString = "#FF5B1A"
        case .BaseOrange: hexString = "#FF4900"
        //    case MediumDarkOrange = "#F39720"
        case .DarkOrange: hexString = "#CB3A00"
        case .LightRed: hexString = "#FF8686"
        case .MediumLightRed: hexString = "#EB5656"
        case .BaseRed: hexString = "#D63031"
        case .MediumDarkRed: hexString = "#B01616"
        case .DarkRed: hexString = "#890101"
        }
        
        return setColor(hexString: hexString, alpha: alpha)
        
    }
    
}
