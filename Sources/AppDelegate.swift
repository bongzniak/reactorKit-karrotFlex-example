//
//  AppDelegate.swift
//  appname
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

        let reactor = MainViewReactor()
        let controller = MainViewController(reactor: reactor)
        let navigationController = BaseNavigationController(rootViewController: controller)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

    

    // MARK: Configure SDK
    private func configureSDKs() {
    
    }
}

