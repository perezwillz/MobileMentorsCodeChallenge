//
//  mobile_mentor_ios_code_challengeUITests.swift
//  mobile_mentor_ios_code_challengeUITests
//
//  Created by Perez Willie Nwobu on 2/21/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import XCTest

@testable import mobile_mentor_ios_code_challenge

class mobile_mentor_ios_code_challengeUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testTableViewElementsArePresentAtLaunch() {
        SearchControllerViewTestPage(testCase: self)
          .verifyTableViewPageIsShowing() 
            .verifyAlbumTableViewCellIsShowing()
    }
    
    

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
