//
//  NASA_Image_APITests.swift
//  NASA Image APITests
//
//  Created by Neil Mrva on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import XCTest
@testable import NASA_Image_API

class NASA_Image_APITests: XCTestCase
{
    var imageDataMC:NASAImageDataModelController?
    
    override func setUp()
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        imageDataMC = NASAImageDataModelController()
    }

    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        imageDataMC = nil
    }

    func testExample()
    {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
