//
//  NASAImage.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation


public struct NASAImage : Decodable
{
    var href : String
    var data : [NASAImageData]
    
}
