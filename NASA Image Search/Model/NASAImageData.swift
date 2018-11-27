//
//  NASAImageData.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation

// Container for image data from NASA API JSON response
public struct NASAImageData : Decodable {
    
    var title : String
    var description : String
    
    // Use private value to store original data from API...
    private var nasaDate : String
    
    // ...and public value to provide format as shown in mockup
    // Would be better to use Date(), will refactor later
    var date : String {
        get {
            return String(nasaDate.split(separator: "T")[0])
        }
    }
    
    var center : String
    var id : String
    
    // Coding keys for JSON decoder
    enum CodingKeys : String, CodingKey {
        case title
        case description
        case nasaDate = "date_created"
        case center
        case id = "nasa_id"
    }
    
}
