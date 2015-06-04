//
//  AppDelegate.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if
            let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainViewController") as? MainViewController,
            let window = window {
                
                mainViewController.viewModel = MainViewModel(photoStore: PhotoStore.sharedInstance)
                
                window.rootViewController = UINavigationController(rootViewController: mainViewController)
                window.makeKeyAndVisible()
        }
        
        return true
    }
}