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
        
        setupView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        SearchResults.searchAlbumResults.removeAll()
        
    }
    
    fileprivate func setupView() {
        
        view.addSubview(albumTableView)
        
        setConstraints()
    }
    
    fileprivate func setupTableView() {
        albumTableView.delegate = self
        albumTableView.dataSource = self
        albumTableView.rowHeight = 150
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
        
        cell.albumLabel.font = UIFont(name: Fonts.DemiBold.name(), size: 15)
        
        NetworkManager().getImage(urlString: SearchResults.searchAlbumResults[indexPath.row].artworkUrl100!) { (image) in
            cell.albumImageView.image = image
        }
        cell.trackLabel.text = "\(SearchResults.searchAlbumResults[indexPath.row + 1].trackName!)"
        cell.albumLabel.text = "\(SearchResults.searchAlbumResults[indexPath.row + 1].collectionName!)"
        cell.artistLabel.text = "\(SearchResults.searchAlbumResults[indexPath.row + 1].artistName!)"
        
        return cell
    }
    
}
