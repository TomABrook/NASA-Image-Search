//
//  NASAImageCollection.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation


public struct NASAImageCollection : Decodable {
    
    var items : [NASAImage]
 
    mutating func parseJSON(data : Data) {
        do {
            self = try JSONDecoder().decode(NASAImageCollection.self, from: data)
        } catch let parsingError {
            print("error: ", parsingError)
        }
    }
}
