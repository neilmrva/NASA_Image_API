//
//  AppDelegate.swift
//  NASA Image API
//
//  Created by Development on 1/12/20.
//  Copyright © 2020 Neil Mrva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    // This will get assigned when app starts (iOS 12) - Doesn't seem to work in xcode 11
    //var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        
        // Inject dependecy of the NASAImageDataModelController into the initial view controller
//        let initialController = window?.rootViewController as! UINavigationController
//        let imageCollectionViewController = initialController.viewControllers.first as! ImageCollectionViewController
//        imageCollectionViewController.nasaImageDataModelController = NASAImageDataModelController()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}
