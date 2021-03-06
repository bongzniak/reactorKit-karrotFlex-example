//
//  AppDelegate.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created by Fernando on 2020/09/29.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        self.configureSDKs()

        let navigationController = BaseNavigationController(
            rootViewController: MainViewController.resolve()
        )

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

    

    // MARK: Configure SDK
    private func configureSDKs() {
    
    }
}

