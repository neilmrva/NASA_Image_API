//
//  NASAImageAPINetworkController.swift
//  NASA Image API
//
//  Created by Neil Mrva on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import Foundation
import UIKit

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
    
    // Makes a network request using the image URL stored inside the image data model and returns a UIImage if successful
    func fetchImage(url:URL, completionHandler: @escaping (UIImage?) -> Void)
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
                    if let data = data
                    {
                        // If data is valid, let's create an image and return it
                        let image = UIImage(data: data)
                        completionHandler(image)
                    }
                    else
                    {
                        completionHandler(nil)
                    }
                }
            }
        }

        // Start network request
        task.resume()
    }

}
