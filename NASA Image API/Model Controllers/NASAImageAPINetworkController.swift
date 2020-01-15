//
//  NASAImageAPINetworkController.swift
//  NASA Image API
//
//  Created by Neil Mrva on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import Foundation

class NASAImageAPINetworkController
{
    // Makes a network request to the NASA Image Search API and if successful, returns the data to the provided completion handler
    func fetchImageCollectionFromNetwork(completionHandler: @escaping (Data?) -> Void)
    {
        let baseURL = URL(string: "https://images-api.nasa.gov/")!
        
        // Construct query
        var searchURL = baseURL.appendingPathComponent("search")
        
        // Let's look for images that were photographed by NASA only
        var components = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)!
        components.queryItems =
        [
            URLQueryItem(name: "media_type", value: "image"),
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
    
    func fetchImage(url:URL, completionHandler: @escaping (Data?) -> Void)
    {
        // Create task and response closure
        // Can optimize this code since it repeats dataTask code in fetchImageCollectionFromNetwork
        let task = URLSession.shared.dataTask(with: url)
        {
            (data, response, error) in

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
