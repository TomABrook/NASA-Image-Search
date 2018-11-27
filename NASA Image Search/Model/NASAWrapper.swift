//
//  APIWrapper.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation

// Wrapper layer in NASA API JSON repsonse
public struct NASAWrapper : Decodable {
    
    var collection : NASAImageCollection
    
}
