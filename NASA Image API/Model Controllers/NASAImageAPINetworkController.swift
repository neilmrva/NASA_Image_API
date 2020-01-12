//
//  NASAImageAPINetworkController.swift
//  NASA Image API
//
//  Created by Development on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import Foundation

class NASAImageAPINetworkController
{
    
    func fetchImageCollectionFromNetwork(completionHandler: @escaping (Data?) -> Void)
    {
        let baseURL = URL(string: "https://images-api.nasa.gov/")!
        
        // Construct query
        var searchURL = baseURL.appendingPathComponent("search")
        
        var components = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)!
        components.queryItems =
        [
            URLQueryItem(name: "media_type", value: "image"),
            //URLQueryItem(name: "location", value: "Moon")
            URLQueryItem(name: "photographer", value: "NASA")
        ]
        
        searchURL = components.url!
        
        // Create task and response closure
        let task = URLSession.shared.dataTask(with: searchURL)
        {
            (data, response, erros) in
            
            if let response = response as? HTTPURLResponse
            {
                if response.statusCode == 200
                {
                    completionHandler(data)
                }
            }
        }

        // Start network request
        task.resume()
    }

    
    
    
    
    
    
}
