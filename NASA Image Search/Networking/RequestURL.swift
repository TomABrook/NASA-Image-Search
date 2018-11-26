//
//  RequestURL.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation



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
    
    public func buildURL() -> URL? {
        
        var urlString = path
        
        if let params = params, params.count > 0 {
            urlString += "?"
            
            for (key, value) in params {
                let valueString = value as! String
                urlString += key + "=" + valueString + "&"
            }
            
            urlString = String(urlString.dropLast())
        }
        
        return URL(string: urlString)
    }
}
