//
//  AppDelegate.swift
//  PatternObserver
//
//  Created by Алексей Уланов on 14.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarControler = UITabBarController()
        tabBarControler.tabBar.backgroundColor = UIColor.systemGray6

        let publisherVC = PublisherViewController()
        publisherVC.tabBarItem = UITabBarItem(title: "Publisher",
                                              image: UIImage(systemName: "antenna.radiowaves.left.and.right.circle"),
                                              selectedImage: UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill"))
        
        let firstObserverVC = FirstObserverViewController()
        firstObserverVC.tabBarItem = UITabBarItem(title: "Observer #1",
                                                  image: UIImage(systemName: "radio"),
                                                  selectedImage: UIImage(systemName: "radio.fill"))
        
        let secondObserverVC = SecondObserverViewController()
        secondObserverVC.tabBarItem = UITabBarItem(title: "Observer #2",
                                                   image: UIImage(systemName: "radio"),
                                                   selectedImage: UIImage(systemName: "radio.fill"))
        
        tabBarControler.viewControllers = [publisherVC, firstObserverVC, secondObserverVC]

        window?.rootViewController = tabBarControler
        window?.makeKeyAndVisible()
        
        return true
    }
}
