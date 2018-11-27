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
    
    unowned let view : SearchResultsView
    
    var items : [NASAImage]?
    
    // MARK: Initializers
    required init(view : SearchResultsView) {
        self.view = view
    }
    
    
    // MARK: Network call
    func loadResults() {
        let request = RequestURL(path: "https://images-api.nasa.gov/search", method: HTTPMethod.get, params: ["q":"milky%20way","media_type":"image","year_start":"2017", "year_end":"2017"], headers: [:])
        
        let nasaRequest = NASARequest(request)
        
        nasaRequest.execute(onSuccess: { (wrapper: NASAWrapper) in
            self.items = wrapper.collection.items
            print("success")
            print(wrapper.collection.items.count)
            self.view.tableView.reloadData()
        }, onError: {(error : Error) in
            print("error")
        })
        
    }
    
    func count() -> Int {
        guard let items = items else {
            print("returning 0 rows")
            return 0
        }
        print("returning non zero item coutn")
        return items.count
    }
    
    // Configures a cell fish data from API query
    func configureCell(_ cell : SearchResultsCell, at indexPath : IndexPath) -> SearchResultsCell {
        
        guard let items = items else {return cell}
        
        let imageData = items[indexPath.row].data[0]
        
        cell.titleLabel.text = imageData.title
        cell.dateCenterLabel.text = imageData.date + " | " + imageData.center
        
        let stringURL = "https://images-assets.nasa.gov/image/" + imageData.id + "/"
        + imageData.id + "~small.jpg"
        
        let imageURL = URL(string: stringURL)
        print(stringURL)
        cell.backgroundImageView.kf.setImage(with: imageURL)
        cell.contentView.bringSubviewToFront(cell.titleLabel)
        
        return cell
        
    }
    
}
