//
//  JSONParser.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONParser {
    
    func parseJSON(searchType: Int, json: JSON, completion: (Bool) -> ()) {
        
        let results = json[JsonResults.results.rawValue]

        for result in results {
            
            let collectionID = result.1[JsonResults.collectionid.rawValue].int != nil ? result.1[JsonResults.collectionid.rawValue].int : -1
            let trackNumber = result.1[JsonResults.trackNumber.rawValue].int != nil ? result.1[JsonResults.trackNumber.rawValue].int : -1
            let trackName = result.1[JsonResults.trackName.rawValue].string != nil ? result.1[JsonResults.trackName.rawValue].string : ""
            let artworkUrl100 = result.1[JsonResults.artworkUrl100.rawValue].string != nil ? result.1[JsonResults.artworkUrl100.rawValue].string : ""
            let artistName = result.1[JsonResults.artistName.rawValue].string != nil ? result.1[JsonResults.artistName.rawValue].string : ""
            let collectionName = result.1[JsonResults.collectionCensoredName.rawValue].string != nil ? result.1[JsonResults.collectionCensoredName.rawValue].string : ""
            
            switch searchType {
            case SearchType.searchAll.rawValue:
                let searchAllResult = ResultsModel(collectionID: collectionID, collectionName: collectionName, trackNumber: trackNumber, trackName: trackName, artworkUrl100: artworkUrl100, artistName: artistName)
                SearchResults.searchAllResults.append(searchAllResult)
            case SearchType.searchAlbum.rawValue:
                let searchAlbumResult = ResultsModel(collectionID: collectionID, collectionName: collectionName, trackNumber: trackNumber, trackName: trackName, artworkUrl100: artworkUrl100, artistName: artistName)
                if searchAlbumResult.trackNumber != -1 {
                    SearchResults.searchAlbumResults.append(searchAlbumResult)
                }
            default:
                completion(false)
                break
            }
            
            
        }
        
        ResultsCount.resultsCount = json[JsonResults.resultCount.rawValue].int!
        completion(true)
    }
    
}
