//
//  Router.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation

public class Request
{
    var errorMessage = ""
    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    public func httpRequest(url : URL, completion : @escaping (Any?) -> ()) -> Void {
        
        dataTask?.cancel()
        
        let task = session.dataTask(with: url, completionHandler: { (data: Data? , response : URLResponse?, error : Error?) -> Void in
            defer { self.dataTask = nil }
            
            if let data = data{
                print("success, data = ", data)
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            
        })
        task.resume()
    
    }
}
