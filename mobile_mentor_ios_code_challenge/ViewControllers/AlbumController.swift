//
//  AlbumController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var albumTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        SearchResults.searchAlbumResults.removeAll()
        
    }
    
    fileprivate func setupView() {
        
        view.addSubview(albumTableView)
        
        setConstraints()
        title = SearchResults.searchAlbumResults[0].collectionName
    }
    
    fileprivate func setupTableView() {
        albumTableView.delegate = self
        albumTableView.dataSource = self
        albumTableView.rowHeight = 75
       albumTableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: "resultsTableViewCell")
        setupView()
    }
    
    func loadViewImage(){
        NetworkManager().getImage(urlString: SearchResults.searchAlbumResults.first!.artworkUrl100!) { (image) in
        
                        DispatchQueue.main.async {
                             //LoadImageView
                        }
            }
    }
    
    
    
    fileprivate func setConstraints() {
        albumTableView.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithTopAndLeadingAnchor(field: albumTableView, width: UIElementSizes.windowWidth, height: UIElementSizes.windowHeight, topAnchor: view.topAnchor, topConstant: UIElementSizes.navigationBarMaxY - 75, leadingAnchor: view.leadingAnchor, leadingConstant: 0)
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
