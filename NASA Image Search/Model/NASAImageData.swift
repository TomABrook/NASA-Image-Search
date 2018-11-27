//
//  NASAImageData.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation

public struct NASAImageData : Decodable {
    
    var title : String
    var description : String
    var date : String
    var center : String
    var id : String
    
    enum CodingKeys : String, CodingKey {
        case title
        case description
        case date = "date_created"
        case center
        case id = "nasa_id"
    }
    
}
