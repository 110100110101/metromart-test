//
//  AppDelegate.swift
//  MetroMart-App
//
//  Created by Jaja Yting on 2/2/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let frame = UIScreen.main.bounds
        self.window = UIWindow(frame: frame)
        
        let concreteProvider = ConcreteProvider()
        let listViewModel = ListViewModel(provider: concreteProvider)
        let listViewController = ListViewController(viewModel: listViewModel)
        let navigationController = UINavigationController(rootViewController: listViewController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

