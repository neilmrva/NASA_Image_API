//
//  NASAImageDataModelController.swift
//  NASA Image API
//
//  Created by Neil Mrva on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import Foundation

class NASAImageDataModelController
{
    // Structure that matches API response at the root and handles the decoding
    struct ResponseModel:Decodable
    {
        let items:Array<ItemModel>
        
        enum CodingKeys: String, CodingKey
        {
            case collection
            case items
        }
        
        init(from decoder: Decoder) throws
        {
            // JSON root object
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            // Decode the image collection
            let collection = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .collection)
            self.items = try collection.decode(Array<ItemModel>.self, forKey: .items)
        }
    }
    
    // Structure to handle nested collection container items
    struct ItemModel:Decodable
    {
        let links:Array<LinksModel>
        let data:Array<DataModel>
        
        enum CodingKeys: String, CodingKey
        {
            case links
            case data
        }
    }
    
    // Structure to decode the image thumbnail URL
    struct LinksModel:Decodable
    {
        let href:String?
        
        enum CodingKeys: String, CodingKey
        {
            case href
        }
    }

    // Structure to decode the image metadata
    struct DataModel:Decodable
    {
        let title:String?
        let description:String?
        let photographer:String?
        let location:String?
        
        enum CodingKeys: String, CodingKey
        {
            case title
            case description
            case photographer
            case location
        }
    }

    // List to hold all processed image data returned from the API in a clean model
    public var imageDataList:Array<NASAImageDetail>
    
    // Helper controller to encapsulate all the network code
    private let networkController:NASAImageAPINetworkController
   
    init()
    {
        imageDataList = Array<NASAImageDetail>()
        
        networkController = NASAImageAPINetworkController()
        networkController.fetchImageCollectionFromNetwork(completionHandler: decodeJSONData)
    }
    
    // A completion handler used to decode the JSON data returned from the network controller
    private func decodeJSONData(_ data:Data?)
    {
        // Ensure we received data
        guard let data = data
        else
        {
            print("decodeJSONData() - No data returned from server")
            return
        }
        
        // Perform decoding on background thread in case of many results
        DispatchQueue.main.async
        {
            let jsonDecoder = JSONDecoder()
            if let responseModel = try? jsonDecoder.decode(ResponseModel.self, from: data)
            {
                for item in responseModel.items
                {
                    let nasaImageDetail = NASAImageDetail(
                        imageURL: item.links.first?.href,
                        title: item.data.first?.title,
                        description: item.data.first?.description,
                        photographer: item.data.first?.photographer,
                        location: item.data.first?.location
                    )

                    self.imageDataList.append(nasaImageDetail)
                }
            }
            else
            {
                print("decodeJSONData() - Unable to decode JSON")
            }
        }
    }

}
