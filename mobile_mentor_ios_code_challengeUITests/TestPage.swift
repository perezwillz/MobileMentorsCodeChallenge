//
//  TestPage.swift
//  mobile_mentor_ios_code_challengeUITests
//
//  Created by Perez Willie Nwobu on 2/21/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//


import Foundation
import XCTest

protocol TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
