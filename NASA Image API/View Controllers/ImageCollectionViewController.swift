//
//  ViewController.swift
//  NASA Image API
//
//  Created by Development on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import UIKit

class ImageCollectionViewController: UICollectionViewController
{
    var nasaImageDataModelController:NASAImageDataModelController!
    var selectedImageDetail:NASAImageDetail?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nasaImageDataModelController = NASAImageDataModelController()
        nasaImageDataModelController.downloadImageCollection()
        nasaImageDataModelController.delegate = self
    }
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int
//    {
//        return 0
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return nasaImageDataModelController.imageDataList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath) as! ImageCollectionViewCell
      //cell.backgroundColor = .black
        
        
        let imageDetail = nasaImageDataModelController.imageDataList[indexPath.item]
        
        nasaImageDataModelController.fetchImage(url: URL(string: imageDetail.imageURL)!)
               {
                   (image) in
                   
                   if let image = image
                   {
                       DispatchQueue.main.async
                       {
                           if let currentIndexPath = self.collectionView.indexPath(for: cell), currentIndexPath == indexPath
                           {
                                cell.imageView?.image = image
                           }
                       }
                   }
               }
        
        
        
      return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        //selectedIndex = indexPath.item
        
        selectedImageDetail = nasaImageDataModelController.imageDataList[indexPath.item]
        
        print("Selected: \(indexPath.item) - \(selectedImageDetail?.title)")
        
        performSegue(withIdentifier: "ImageDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //if segue.identifier == "ImageDetailSegue"
       // {
            if let imageDetailViewController = segue.destination as? ImageDetailViewController//, let selectedImageDetail = selectedImageDetail
            {
                imageDetailViewController.nasaImageDataModelController = nasaImageDataModelController
                imageDetailViewController.nasaImageDetail = selectedImageDetail//nasaImageDataModelController.imageDataList[selectedIndex]
            }
        //}
    }


}

extension ImageCollectionViewController:NASAImageDataModelControllerProtocol
{
    func imageCollectionDownloaded()
    {
        print("Items ready to display")
        collectionView.reloadData()
    }
    
    
}
