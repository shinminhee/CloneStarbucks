//
//  SceneDelegate.swift
//  StarbucksApp
//
//  Created by 신민희 on 2021/05/20.
//

//house.fill 홈 creditcard.fill 카드 gift.fill 선물 homepod 커피 gearshape

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        UINavigationBar.setTransparentTabbar()
        let homeVC = HomeViewController()
        let payVC = PayViewController()
        let orderVC = OrderViewController()
        let giftVC = GiftViewController()
        let otherVC = OtherViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        payVC.tabBarItem = UITabBarItem(title: "Pay", image: UIImage(systemName: "creditcard.fill"), tag: 0)
        orderVC.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "homepod"), tag: 0)
        giftVC.tabBarItem = UITabBarItem(title: "Gift", image: UIImage(systemName: "gift.fill"), tag: 0)
        otherVC.tabBarItem = UITabBarItem(title: "Other", image: UIImage(systemName: "gearshape"), tag: 0)
        
        let tabBarController = UITabBarController()
        
        let homeViewController = UINavigationController(rootViewController: homeVC)
        let payNaviController = UINavigationController(rootViewController: payVC)
        let orderViewController = UINavigationController(rootViewController: orderVC)
        let giftNaviController = UINavigationController(rootViewController: giftVC)
        let otherViewController = UINavigationController(rootViewController: otherVC)
        
        tabBarController.viewControllers = [homeViewController, payNaviController, orderViewController, giftNaviController, otherViewController]
        
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

extension UINavigationBar {
    static func setTransparentTabbar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage     = UIImage()
        UINavigationBar.appearance().clipsToBounds   = true
    }
}
