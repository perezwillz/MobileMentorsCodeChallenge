//
//  NetworkManager.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ResultsCount {
    static var resultsCount: Int = 1000
}

enum SearchType: Int {
    case searchAll = 0
    case searchAlbum = 1
}

class NetworkManager {
    
    func searchByTerm(urlString: String, completion: @escaping (JSON) -> ()) {
           print(urlString)
        guard  let url = URL(string: urlString) else {
            print("There is something wrong with this album url")
            return
        }
        
     
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data else {
                print("There is something wrong when tring to get data from this url")
                return
            }
            let json = try! JSON(data: data)
            
            completion(json)
            
        }).resume()
        
    }
    
    func getImage(urlString: String, completion: @escaping (UIImage) -> ()) {
        
        let request = URL(string: urlString)
        
        URLSession.shared.dataTask(with: request!, completionHandler: { (data, response, error) in
            
            if error != nil {
                
                print("ERROR: \(error!)")
                
                return
                
            }

            let image = UIImage(data: data!)!
            
            completion(image)
            
        }).resume()
        
    }
    
}
