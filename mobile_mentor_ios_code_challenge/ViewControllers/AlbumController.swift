//
//  AlbumController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     let albumView: AlbumView = { return AlbumView() }()
    
    var albumTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewImage()
        setupView()
        setupTableView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        SearchResults.searchAlbumResults.removeAll()
        
    }
    
    fileprivate func setupView() {
        
        view.addSubview(albumTableView)
        view.addSubview(albumView)
        albumView.albumNameLabel.numberOfLines = 3
        albumView.artistLabel.numberOfLines = 3
        setConstraints()
       
        title = SearchResults.searchAlbumResults[0].collectionName
    }
    
    fileprivate func setupTableView() {
        albumTableView.delegate = self
        albumTableView.dataSource = self
        albumTableView.rowHeight = 75
       albumTableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: "resultsTableViewCell")
       
    }
    
    func loadViewImage(){
        NetworkManager().getImage(urlString: SearchResults.searchAlbumResults.first!.artworkUrl100!) { (image) in
        
                        DispatchQueue.main.async {
                            self.albumView.albumImageView.image = image
                            
                            guard let albumName = SearchResults.searchAlbumResults[0].collectionName else {return
                                
                            }
                            self.albumView.albumNameLabel.text = albumName
                            self.albumView.artistLabel.text = SearchResults.searchAlbumResults[0].artistName
                            
                        }
            }
    }
    
    
    
    fileprivate func setConstraints() {
        albumTableView.translatesAutoresizingMaskIntoConstraints = false
        albumView.translatesAutoresizingMaskIntoConstraints = false
        
            Constraints().constraintWithTopAndCenterXAnchor(field: albumView, width: UIElementSizes.windowWidth, height: 300, topAnchor: view.topAnchor, topConstant: UIElementSizes.navigationBarMaxY - 75, centerXAnchor: view.centerXAnchor, centerXConstant: 0)
        
        
        Constraints().constraintWithTopAndLeadingAnchor(field: albumTableView, width: UIElementSizes.windowWidth, height: UIElementSizes.windowHeight, topAnchor: albumView.bottomAnchor, topConstant: 0, leadingAnchor: view.leadingAnchor, leadingConstant: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = SearchResults.searchAlbumResults.count
        albumTableView.frame.size.height = albumTableView.rowHeight * CGFloat(rowCount)
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultsTableViewCell = { return ResultsTableViewCell() }()
        cell.selectionStyle = .none
        cell.albumImageView.removeFromSuperview()
        cell.albumLabel.removeFromSuperview()
        cell.artistLabel.removeFromSuperview()
        
        cell.trackLabel.text = "   \(SearchResults.searchAlbumResults[indexPath.row].trackName!)"

        
        return cell
    }
    
}
