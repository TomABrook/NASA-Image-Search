//
//  RESTURL.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation

public class RESTURL {
    
    let baseURL : String
    let endPoint : String?
    let parameters : [String : String]
    
    init(baseURL: String, endPoint: String = "", parameters : [String:String] = [:]) {
        self.baseURL = baseURL
        self.endPoint = endPoint
        self.parameters = parameters
    }
    
    func url() -> URL? {
        
        var urlString = baseURL
        
        if let endPoint = endPoint {
            urlString += "/" + endPoint
        }
        
        if parameters.count > 0 {
            urlString += "?"
            
            for (key, value) in parameters {
                urlString += key + "=" + value + "&"
            }
            
            urlString = String(urlString.dropLast())
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        return url
    }
}
