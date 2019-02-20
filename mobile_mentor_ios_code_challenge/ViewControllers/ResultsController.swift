//
//  ResultsController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit
import SwiftyJSON

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var resultsTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        setupTableView()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupTableView() {
        
        resultsTableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: "resultsTableViewCell")
        resultsTableView.backgroundColor = ColorPalette.DarkGray.setHexColor(alpha: 1)
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.rowHeight = 150
        setupView()
        
    }
    
    fileprivate func setupView() {
        guard let artistName = SearchResults.searchAllResults[0].artistName else { return }
        title = artistName
        
        view.addSubview(resultsTableView)
        
        setConstraints()
        
    }
    
    fileprivate func setConstraints() {
        
        resultsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithCenterYAndCenterXAnchor(field: resultsTableView, width: UIElementSizes.windowWidth, height: UIElementSizes.windowHeight, centerYAnchor: view.centerYAnchor, centerYConstant: 0, centerXAnchor: view.centerXAnchor, centerXConstant: 0)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = SearchResults.searchAllResults.count > 0 ? SearchResults.searchAllResults.count : 0
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultsTableViewCell = { ResultsTableViewCell() }()
        cell.selectionStyle = .none
        
        cell.artistLabel.font = UIFont(name: Fonts.DemiBold.name(), size: 15)
        
        NetworkManager().getImage(urlString: SearchResults.searchAllResults[indexPath.row].artworkUrl100!) { (image) in
            DispatchQueue.main.async {
                 cell.albumImageView.image = image
            }
           
        }
        
        cell.trackLabel.text = "\(SearchResults.searchAllResults[indexPath.row].trackName!)"
        cell.albumLabel.text = "\(SearchResults.searchAllResults[indexPath.row].collectionName!)"
        cell.artistLabel.text = "\(SearchResults.searchAllResults[indexPath.row].artistName!)"
        
        return cell
    }
    
    //FIX BUG
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let albumName = SearchResults.searchAllResults[indexPath.row].collectionName else {
            print("This album does not have an album name")
            return
        }
       
        print("THIS IS THE ALBUM NAME \(albumName)")
        
        NetworkManager().searchByTerm(urlString: "https://itunes.apple.com/search?term=\(String(describing: albumName))") { (json) in
            self.parseJSON(json: json)
        }
    }
    
    fileprivate func parseJSON(json: JSON) {
        JSONParser().parseJSON(searchType: SearchType.searchAlbum.rawValue, json: json) { (boolValue) in
            switch boolValue {
            case true:
                DispatchQueue.main.async {
                    self.presentAlbumViewController()
                }
                
            case false:
                DispatchQueue.main.async {
                    let title = "Unknown Error"
                    let message = "There was an error processing your request. Please try again."
                    let alertController = CreateAlertController().withCancelAction(title: title, message: message)
                    self.present(alertController, animated: true, completion: nil)
                }
       
            }
        }
    }
    
    fileprivate func presentAlbumViewController() {
        let viewController = AlbumViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
