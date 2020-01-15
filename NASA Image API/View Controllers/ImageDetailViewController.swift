//
//  ImageDetailViewController.swift
//  NASA Image API
//
//  Created by Neil Mrva on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var photographerLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    // Dependencies that will be passed in when a cell is selected
    var nasaImageDataModelController:NASAImageDataModelController!
    var nasaImageDetail:NASAImageDetail!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // Assign all values and load image before the view appears on screen
    override func viewWillAppear(_ animated: Bool)
    {
        nasaImageDataModelController.fetchImage(url: URL(string: nasaImageDetail.imageURL)!)
        {
            (image) in
            
            if let image = image
            {
                DispatchQueue.main.async
                {
                    self.imageView?.image = image
                }
            }
        }
        
        titleTextView.text = nasaImageDetail.title
        descriptionTextView.text = nasaImageDetail.description
        photographerLabel.text = nasaImageDetail.photographer
        locationLabel.text = nasaImageDetail.location
    }
    
    // Reset all data on screen when the view begins to unwind
    override func viewWillDisappear(_ animated: Bool)
    {
        self.imageView?.image = nil
        titleTextView.text = nil
        descriptionTextView.text = nil
        photographerLabel.text = nil
        locationLabel.text = nil
    }

}
