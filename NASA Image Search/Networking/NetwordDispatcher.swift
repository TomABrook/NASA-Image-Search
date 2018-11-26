//
//  NetwordDispatcher.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation


public struct NetworkDispatcher {
    public static let instance = NetworkDispatcher()
    private init() {}
    
    public enum ConnError: Swift.Error {
        case invalidURL
        case noData
    }
    
    public func dispatch(request: RequestURL, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = request.buildURL() else {
            onError(ConnError.invalidURL)
            return
        }
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }
            
            guard let _data = data else {
                onError(ConnError.noData)
                return
            }
            
            onSuccess(_data)
            }.resume()
    }
}
