//
//  SceneDelegate.swift
//  NetfilxStyleSample
//
//  Created by 이준복 on 2022/03/24.
//

import Foundation
import UIKit

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let layout = UICollectionViewFlowLayout()
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        let rootNavigationController = UINavigationController(rootViewController: homeViewController)
        rootNavigationController.view.backgroundColor = .black
        
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
        
    }
}
