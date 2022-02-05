//
//  SceneDelegate.swift
//  Books
//
//  Created by Daniel Gomes on 13/09/21.
//

import UIKit
import DI
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties
    var window: UIWindow?
    var dependencyInjector: DependencyInjector?

    private lazy var container: Container = {
        return Container()
    }()

    // MARK: - Methods
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        dependencyInjector = DependencyInjector(window: window, navigationController: UINavigationController())

        dependencyInjector?.build(completion: { [unowned self] in
            self.window = $1.window
            self.container = $1.container
            $1.start()
        })
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

