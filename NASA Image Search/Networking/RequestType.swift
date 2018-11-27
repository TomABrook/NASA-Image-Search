//
//  RequestType.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation

// Supporting this protocall allows for requests using a RESTURL to be queried by the network dispatcher
public protocol RequestType {
    associatedtype ResponseType: Decodable
    var requestURL: RequestURL { get }
}

public extension RequestType {
    
    // Excute network request. Developer provides functions to handle success and error conditions
    public func execute (
        dispatcher: NetworkDispatcher = NetworkDispatcher.instance,
        onSuccess: @escaping (ResponseType) -> Void,
        onError: @escaping (Error) -> Void
        ) {
        dispatcher.dispatch(
            request: self.requestURL,
            onSuccess: { (responseData: Data) in
                do {
                    // If network request is successful decode JSON response
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(ResponseType.self, from: responseData)
                    DispatchQueue.main.async {
                        // Pass response back to be handled
                        onSuccess(result)
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        // Pass error back to be handled
                        onError(error)
                    }
                }
        },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
        }
        )
    }
}
