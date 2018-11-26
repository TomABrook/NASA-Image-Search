//
//  SearchResultsPresenter.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation


public class SearchResultsPresenter {
    
    unowned let view : SearchResultsView
    
    // MARK: Initializers
    required init(view : SearchResultsView) {
        self.view = view
    }
    
    
    // MARK: Network call
    func loadResults() {
        let request = RequestURL(path: "https://images-api.nasa.gov/search", method: HTTPMethod.get, params: ["q":"milky%20way","media_type":"image","year_start":"2017", "year_end":"2017"], headers: [:])
        
        let nasaRequest = NASARequest(request)
        
        nasaRequest.execute(onSuccess: { (wrapper: NASAWrapper) in
            self.view.items = wrapper.collection.items
            print("success")
            print(wrapper.collection.items.count)
            self.view.tableView.reloadData()
        }, onError: {(error : Error) in
            print("error")
        })
        
    }
}
