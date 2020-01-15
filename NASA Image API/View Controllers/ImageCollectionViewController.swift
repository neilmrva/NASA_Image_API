//
//  ViewController.swift
//  NASA Image API
//
//  Created by Neil Mrva on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import UIKit

class ImageCollectionViewController: UICollectionViewController
{
    var nasaImageDataModelController:NASAImageDataModelController!
    var selectedImageDetail:NASAImageDetail?
    
    // Will be called only once
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // After loading the view, begin downloading the image collection. (could use a activity indicator/animation while we wait for data)
        nasaImageDataModelController.downloadImageCollection()
        nasaImageDataModelController.delegate = self
    }
    
    // Called to determine how many cells to display
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return nasaImageDataModelController.imageDataList.count
    }
    
    // Returns a configured cell to the UICollection
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        // Retreive the cell and cast it ImageCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath) as! ImageCollectionViewCell
        
        // Turn on the activity indicator while the image downloads
        cell.showActivityIndicator(show: true)
        
        // Get the current image model for this cell
        let imageDetail = nasaImageDataModelController.imageDataList[indexPath.item]

        // Fetch image
        nasaImageDataModelController.fetchImage(url: URL(string: imageDetail.imageURL)!)
        {
            (image) in
            
            if let image = image
            {
                DispatchQueue.main.async
                {
                    // Let's ensure the cell is being populated with the correct image
                    if let currentIndexPath = self.collectionView.indexPath(for: cell), currentIndexPath == indexPath
                    {
                        cell.showActivityIndicator(show: false)
                        cell.imageView?.image = image
                    }
                }
            }
        }

        return cell
    }
    
    // Called when pressing a cell and used to trigger a segue to the detail screen
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        // Let's store the selected iamge data model to pass along to the detail screen
        selectedImageDetail = nasaImageDataModelController.imageDataList[indexPath.item]
        
        performSegue(withIdentifier: "ImageDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Let's double check that our destination is in fact the Detail view controller we expect
        if let imageDetailViewController = segue.destination as? ImageDetailViewController
        {
            // Inject our dependencies
            imageDetailViewController.nasaImageDataModelController = nasaImageDataModelController
            imageDetailViewController.nasaImageDetail = selectedImageDetail
        }
    }

}

extension ImageCollectionViewController:NASAImageDataModelControllerProtocol
{
    // Called when the model controller has completed downloading the image collection
    func imageCollectionDownloaded()
    {
        // Reload the collection view so that all cells are configured
        collectionView.reloadData()
    }
    
}
