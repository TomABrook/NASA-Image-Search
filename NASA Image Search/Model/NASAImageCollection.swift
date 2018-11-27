//
//  NASAImageCollection.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation

// Array of items in NASA API JSON response
public struct NASAImageCollection : Decodable {
    
    var items : [NASAImage]

}
