//
//  SearchController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    let searchView: SearchView = { return SearchView() }()
    let networkManager : NetworkManager = { return NetworkManager() }()
    let jsonParser : JSONParser = { return JSONParser() }()
    
    
    //TableView
    var searchHistoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = ColorPalette.DarkGray.setHexColor(alpha: 0)
        
        return tableView
    }()
    
    fileprivate func setupTableView() {
        
        searchHistoryTableView.delegate = self
        searchHistoryTableView.dataSource = self
        searchHistoryTableView.rowHeight = 50
        searchHistoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "searchHistoryTableViewCell")
        searchHistoryTableView.backgroundColor = .black
        searchHistoryTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = UserAccountViewModel.userEmail
        view.backgroundColor = ColorPalette.DarkGray.setHexColor(alpha: 1)
        
        getUserSearchHistory()
        setupTableView()
        setupView()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOutButtonTap(sender:)))

        searchView.searchButton.addTarget(self, action: #selector(handleSearchButtonTap(sender:)), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SearchResults.searchAllResults.removeAll()
        searchView.searchTextField.text = ""
       //searchHistoryTableView.isHidden = SearchHistoryViewModel.searchTerms.count > 0 ? false : true
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func getUserID() {
        guard let email = UserAccountViewModel.userEmail else { return }
        title = email
        SearchHistoryViewModel.userID = UserAccountViewModel().getUserID(forEmailAddress: email)
    }
    
    fileprivate func getUserSearchHistory() {
        guard let userID = SearchHistoryViewModel.userID else { return }
        SearchHistoryViewModel().getSearchHistory(userID: userID)
    }
    
    
    
    fileprivate func setupView() {
        
        searchView.searchTextField.delegate = self
        
        
        let dismissKeyboardTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        dismissKeyboardTapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(dismissKeyboardTapGestureRecognizer)
        
        searchHistoryTableView.isHidden = false
        
        view.addSubview(searchView)
        view.addSubview(searchHistoryTableView)
        
        searchView.searchTextField.isUserInteractionEnabled = true
        setConstraints()
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    fileprivate func setConstraints() {
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchHistoryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithTopAndCenterXAnchor(field: searchView, width: UIElementSizes.windowWidth, height: 150, topAnchor: view.topAnchor, topConstant: UIElementSizes.navigationBarMaxY - 75, centerXAnchor: view.centerXAnchor, centerXConstant: 0)
        
        Constraints().constraintWithTopAndCenterXAnchor(field: searchHistoryTableView, width: UIElementSizes.windowWidth, height: UIElementSizes.windowHeight - (UIElementSizes.navigationBarMaxY - 75) - searchView.frame.height, topAnchor: searchView.bottomAnchor, topConstant: 25, centerXAnchor: view.centerXAnchor, centerXConstant: 0)
    }
    
    @objc func handleSearchButtonTap(sender: UIButton) {
        
        guard let searchString = searchView.searchTextField.text else { return }
        
        if searchString.isEmpty {
            let alertController = CreateAlertController().withCancelAction(title: "Invalid Search", message: "Please enter a valid search term and try again.")
            present(alertController, animated: true) {
                self.searchView.searchTextField.text = ""
                self.searchView.searchTextField.becomeFirstResponder()
            }
        } else {
            logSearchInHistory(forTerm: searchString)
            
            let searchTerm = searchString.replacingOccurrences(of: " ", with: "+")
            
            let urlString = "https://itunes.apple.com/search?term=\(searchTerm)"
            
            makeAPICall(withURLString: urlString)
            //MakeApICall should return completion handler so we can navigat to another view after completion
            
        }
    }
    
    fileprivate func makeAPICall(withURLString string: String) {
        networkManager.searchByTerm(urlString: string) { (json) in
            let jsonData = json
            self.jsonParser.parseJSON(searchType: SearchType.searchAll.rawValue, json: jsonData, completion: { (sucess) in
                
                if sucess {
                    //Reload JSON in the background thread
                    print("Sucess in getting JSONData")
                    DispatchQueue.main.async {
                        self.searchHistoryTableView.reloadData()
                        self.presentResultsController()
                    }
                } else {
                    print("there was an error after completion")
                }
            })
        }
    }
    
    fileprivate func logSearchInHistory(forTerm term: String) {
        
        SearchHistoryViewModel.searchTerms.append(term)
        SearchHistoryViewModel.searchDates.append(Date())
        
        SearchHistoryViewModel().logSearch()
        
    }
    
    
    fileprivate func presentResultsController() {
        let viewController = ResultsViewController()
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
    @objc func handleSignOutButtonTap(sender: UIBarButtonItem) {
        
        dismiss(animated: false) {
            SearchHistoryViewModel.searchTerms.removeAll()
            SearchHistoryViewModel.searchDates.removeAll()
            self.searchHistoryTableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchHistoryHeaderView: SearchHistoryHeaderView = { return SearchHistoryHeaderView() }()
        searchHistoryHeaderView.clearHistoryButton.addTarget(self, action: #selector(handleClearHistoryButtonTap), for: .touchUpInside)
        
        return searchHistoryHeaderView
    }
    
    @objc func handleClearHistoryButtonTap(sender: UIButton) {
        SearchHistoryViewModel.searchTerms.removeAll()
        SearchHistoryViewModel.searchDates.removeAll()
        searchHistoryTableView.reloadData()
        searchHistoryTableView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchHistoryTableView.frame.size.height = 50 * CGFloat(SearchHistoryViewModel.searchTerms.count)
        return SearchHistoryViewModel.searchTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        
        cell.frame = CGRect(x: 0, y: 0, width: UIElementSizes.windowWidth, height: 50)
        cell.backgroundColor = ColorPalette.DarkGray.setHexColor(alpha: 1)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY hh:mm:ss"
        let dateAsString = dateFormatter.string(from: SearchHistoryViewModel.searchDates[indexPath.row])
        cell.searchTermLabel.text = SearchHistoryViewModel.searchTerms[indexPath.row]
        cell.dateLabel.text = dateAsString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath[1]
        
        searchView.searchTextField.text = SearchHistoryViewModel.searchTerms[row]
        
        handleSearchButtonTap(sender: searchView.searchButton)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
