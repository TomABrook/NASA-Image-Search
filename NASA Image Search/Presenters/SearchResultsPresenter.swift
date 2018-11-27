//
//  SearchResultsPresenter.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation
import Kingfisher

public class SearchResultsPresenter {
    
    // Reference to view
    unowned let view : SearchResultsView
    
    // MARK: Datasource
    var items : [NASAImage]?
    
    // MARK: Initializers
    required init(view : SearchResultsView) {
        self.view = view
    }
    
    
    // MARK: Network call to get data from API
    func loadResults() {
        
        // Clear errors
        view.errorLabel.text = ""
        view.retryButton.isHidden = true
        
        // Default url. This should be overrided if search paraemeters are provided user
        let request = RequestURL(path: "https://images-api.nasa.gov/search", method: HTTPMethod.get, params: ["q":"milky%20way","media_type":"image","year_start":"2017", "year_end":"2017"], headers: [:])
        
        // Initalize request
        let nasaRequest = NASARequest(request)
        
        // Excute request
        do {
            nasaRequest.execute(onSuccess: { (wrapper: NASAWrapper) in
                self.items = wrapper.collection.items
                print("success")
                print(wrapper.collection.items.count)
                self.view.tableView.reloadData()
            }, onError: {(error : Error) in
                self.view.errorLabel.text = "A network error has occurred"
                self.view.retryButton.isHidden = false
            })
        }
    }
    
    // Return the number of data
    func count() -> Int {
        // Check we have items to count
        guard let items = items else {
            return 0
        }
        
        return items.count
    }
    
    // Configures a cell with data from API query
    func configureCell(_ cell : SearchResultsCell, at indexPath : IndexPath) -> SearchResultsCell {
        
        // Check we have data else return an empty cell
        guard let items = items else {return cell}
        
        // Traverse json architecture to get relevant data
        let imageData = items[indexPath.row].data[0]
        
        // Assign data to cell
        cell.imageData = imageData
        cell.titleLabel.text = imageData.title
        cell.dateCenterLabel.text = imageData.date + " | " + imageData.center
        
        let stringURL = "https://images-assets.nasa.gov/image/" + imageData.id + "/"
        + imageData.id
        
        // Full size image to be used in detail view
        cell.imageURLString = stringURL + "~orig.jpg"
        
        // Small image for this view
        let imageURL = URL(string: stringURL + "~thumb.jpg")
        
        // Asychronous task to cache the image and assign it to the cell
        cell.backgroundImageView.kf.setImage(with: imageURL)
        
        // Force label to front of cell
        cell.contentView.bringSubviewToFront(cell.titleLabel)
        
        return cell
        
    }
    
}
