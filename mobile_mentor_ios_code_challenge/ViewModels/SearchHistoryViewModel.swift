//
//  SearchHistoryViewModel.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/13/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

struct SearchHistoryViewModel {
    
    static var userID: Int?
    static var searchTerms = [String]()
    static var searchDates = [Date]()
    
    func logSearch() {
        guard let userID = SearchHistoryViewModel.userID else { return }
        SearchHistory.searchHistoryTerms[userID] = SearchHistoryViewModel.searchTerms
        SearchHistory.searchHistoryDates[userID] = SearchHistoryViewModel.searchDates
    }
    
    func getSearchHistory(userID: Int) {
        guard let searchTerms = SearchHistory.searchHistoryTerms[userID],
            let searchDates = SearchHistory.searchHistoryDates[userID] else { return }
        
        SearchHistoryViewModel.searchTerms = searchTerms
        SearchHistoryViewModel.searchDates = searchDates
    }
    
}
