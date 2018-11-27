//
//  SearchResultsView.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import UIKit

class SearchResultsView: UITableViewController {
    
    // Presenter reference
    var presenter : SearchResultsPresenter!
    
    // MARK: Outlets
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var retryButton: UIButton!
    
    // Used to pass data to detail page
    var selectedImageData : NASAImageData?
    var selectedImage : UIImage?
    
    // MARK: Initial loading
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Intialize presenter and load data
        presenter = SearchResultsPresenter(view: self)
        
        // Initialize error to be blank. Errors may occur in subsquent load results call
        errorLabel.text = ""
        
        // Hide retry button by default
        retryButton.isHidden = true
        
        presenter.loadResults()
        
        // Remove transparency from navigation bar
        self.navigationController?.navigationBar.isTranslucent = false

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // If an error didn't occur and no results were loaded, print message to user
        if presenter.count() == 0, errorLabel.text == "" {
            errorLabel.text = "The network request timed out."
            retryButton.isHidden = false
        } else {
            errorLabel.text = ""
            retryButton.isHidden = true
        }
        
        return presenter.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsCell", for: indexPath) as! SearchResultsCell
        
        // Let presenter handle populating cell with data from model
        return presenter.configureCell(cell, at: indexPath)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }

    // Retry loading results when button is pushed
    @IBAction func retryLoading(_ sender: UIButton) {
        errorLabel.text = ""
        presenter.loadResults()
    }
    
    /*
    // MARK: - Navigation
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // If seguing to an image detail view...
        if let destination = segue.destination as? ImageDetailView,
            let cell = sender as? SearchResultsCell {
            
            //...pass data from the cell
            destination.selectedImageData = cell.imageData
            destination.imageURLString = cell.imageURLString
            
            // Remove title from back button in presented view
            let back = UIBarButtonItem()
            back.title = ""
            back.tintColor = UIColor.white
            navigationItem.backBarButtonItem = back
        }
    }
    
}
