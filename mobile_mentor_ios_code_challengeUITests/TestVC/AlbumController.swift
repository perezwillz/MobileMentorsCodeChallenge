//
//  AlbumController.swift
//  mobile_mentor_ios_code_challengeUITests
//
//  Created by Perez Willie Nwobu on 2/21/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//


import Foundation
import XCTest

struct AlbumControllerViewTestPage : TestPage {
    
    var testCase: XCTestCase
    
    var tableView : XCUIElement {
        return app.tables.element(boundBy: 0)
    }
    
    func tableViewCell(at index : Int) -> XCUIElement {
        return tableView.cells.element(boundBy: index)
    }
    
    
    
    @discardableResult func verifyCollectionViewPageIsShowing(file: String = #file, line: UInt = #line) -> AlbumControllerViewTestPage{
        testCase.expect(exists: tableView, file: file, line: line)
        return self
    }
    
    @discardableResult func verifyPhotoCollectionViewCellIsShowing(file: String = #file, line: UInt = #line) -> AlbumControllerViewTestPage {
        testCase.expect(exists: tableViewCell(at: 0), file: file, line: line)
        tableViewCell(at: 0).tap()
        return self
    }
}



