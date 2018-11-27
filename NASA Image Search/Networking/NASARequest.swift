//
//  NASARequest.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation


public struct NASARequest : RequestType {
    public var requestURL: RequestURL
    public typealias ResponseType = NASAWrapper
    
    public init(_ request : RequestURL) {
        self.requestURL = request
    }
}
