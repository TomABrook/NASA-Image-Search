//
//  RequestURL.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation


// Class to capture a url request
public struct RequestURL {
    
    public let path: String
    public let method: HTTPMethod
    public let params: [String: Any?]?
    public let headers: [String: String]?
    
    public init (
        path: String,
        method: HTTPMethod = .get,
        params: [String: Any?]? = nil,
        headers: [String: String]? = nil
        ) {
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }
    
    // Combine components to return the absolute url
    public func buildURL() -> URL? {
        
        var urlString = path
        
        // If there are parameters, loop through them and append
        if let params = params, params.count > 0 {
            urlString += "?"
            
            for (key, value) in params {
                let valueString = value as! String
                urlString += key + "=" + valueString + "&"
            }
            
            // Removes "&" from the end of the string
            urlString = String(urlString.dropLast())
        }
        
        return URL(string: urlString)
    }
}
