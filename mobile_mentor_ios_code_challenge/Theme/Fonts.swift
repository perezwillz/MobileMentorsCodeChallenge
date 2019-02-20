//
//  Fonts.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

enum Fonts {
    case Bold, BoldItalic, DemiBold, DemoBoldItalic, Heavy, HeavyItalic, Italic, Medium, MediumItalic, Regular, UltraLight, UltraLightItalic
    
    func name() -> String {
        switch self {
        case .Bold:
            return "AvenirNext-Bold"
        case .BoldItalic:
            return "AvenirNext-BoldItalic"
        case .DemiBold:
            return "AvenirNext-DemiBold"
        case .DemoBoldItalic:
            return "AvenirNext-DemiBoldItalic"
        case .Heavy:
            return "AvenirNext-Heavy"
        case .HeavyItalic:
            return "AvenirNext-HeavyItalic"
        case .Italic:
            return "AvenirNext-Italic"
        case .Medium:
            return "AvenirNext-Medium"
        case .MediumItalic:
            return "AvenirNext-MediumItalic"
        case .Regular:
            return "AvenirNext-Regular"
        case .UltraLight:
            return "AvenirNext-UltraLight"
        case .UltraLightItalic:
            return "AvenirNext-UltraLightItalic"
        }
    }
}
