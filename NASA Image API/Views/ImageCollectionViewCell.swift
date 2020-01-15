//
//  ImageCollectionViewCell.swift
//  NASA Image API
//
//  Created by Neil Mrva on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import UIKit

class ImageCollectionViewCell:UICollectionViewCell
{
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!
    @IBOutlet weak var imageView:UIImageView!
    
    func showActivityIndicator(show:Bool)
    {
        if show
        {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }
        else
        {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
    
}
