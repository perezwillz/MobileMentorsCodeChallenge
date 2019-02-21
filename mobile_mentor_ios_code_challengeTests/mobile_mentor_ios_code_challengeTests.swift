//
//  mobile_mentor_ios_code_challengeTests.swift
//  mobile_mentor_ios_code_challengeTests
//
//  Created by Perez Willie Nwobu on 2/21/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import XCTest
@testable import mobile_mentor_ios_code_challenge
class mobile_mentor_ios_code_challengeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testUserVM(){
        let defaultUserEmail = UserAccounts.userAccountEmail.first!.value
        let viewModelEmail = UserAccountViewModel.userEmail
        
        XCTAssertEqual(defaultUserEmail, viewModelEmail)
        
    }

    func testSearchResultsVM(){
        let searchresultsArray = [ResultsModel]()
        let searchResultsVM = SearchResults.searchAlbumResults
        XCTAssertEqual(searchresultsArray.count, searchResultsVM.count)
    }
    

    func testJsonEnumeration(){
          XCTAssertEqual(JsonResults.resultCount.rawValue, "resultCount")
          XCTAssertEqual(JsonResults.results.rawValue, "results")
          XCTAssertEqual(JsonResults.collectionid.rawValue,"collectionid")
          XCTAssertEqual(JsonResults.trackName.rawValue, "trackName")
          XCTAssertEqual(JsonResults.collectionCensoredName.rawValue, "collectionCensoredName")
          XCTAssertEqual(JsonResults.artworkUrl100.rawValue, "artworkUrl100")
          XCTAssertEqual(JsonResults.artistName.rawValue, "artistName")
          XCTAssertEqual(JsonResults.trackNumber.rawValue, "trackNumber")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
