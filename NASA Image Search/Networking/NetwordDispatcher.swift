//
//  NetwordDispatcher.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation

// Class to proccess network requests
public struct NetworkDispatcher {
    public static let instance = NetworkDispatcher()
    private init() {}
    
    // Error enum
    public enum ConnError: Swift.Error {
        case invalidURL
        case noData
    }
    
    // Person request using URL session. Data returned via escaping arguments
    public func dispatch(request: RequestURL, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        // Check request url builds successfully
        guard let url = request.buildURL() else {
            onError(ConnError.invalidURL)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        // Set http method based on request parameter
        urlRequest.httpMethod = request.method.rawValue
        
        let config = URLSessionConfiguration.default
        
        // Set connection time out values
        config.timeoutIntervalForRequest = 3
        config.timeoutIntervalForResource = 10
        
        // Initialise session
        let session = URLSession(configuration: config)
        
        // Create a new data task to carry out request
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                // If there was an error, handle it
                onError(error)
                return
            }
            
            // Check data was returned
            guard let _data = data else {
                onError(ConnError.noData)
                return
            }
            
            // Proccess data
            onSuccess(_data)
            }.resume()
    }
}
