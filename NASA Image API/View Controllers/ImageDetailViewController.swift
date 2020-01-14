//
//  ImageDetailViewController.swift
//  NASA Image API
//
//  Created by Development on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photographerLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var nasaImageDetail:NASAImageDetail!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
//        titleLabel.text = nasaImageDetail.title
//        descriptionLabel.numberOfLines = 0
//        descriptionLabel.text = nasaImageDetail.description
//        photographerLabel.text = nasaImageDetail.photographer
//        locationLabel.text = nasaImageDetail.location
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
//        titleLabel.text = nil
//        descriptionLabel.text = nil
//        photographerLabel.text = nil
//        locationLabel.text = nil
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
