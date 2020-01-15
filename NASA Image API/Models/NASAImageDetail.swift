//
//  NASAImageDetail.swift
//  NASA Image API
//
//  Created by Neil Mrva on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import Foundation

struct NASAImageDetail
{
    let imageURL:String
    var imageData:Data?
    let title:String
    let description:String
    let photographer:String
    let location:String
}
