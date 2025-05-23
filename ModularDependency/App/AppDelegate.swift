//
//  AppDelegate.swift
//  ModularDependency
//
//  Created by Tin Le on 22/5/25.
//

import UIKit
import LoginModule
import HomeModule
import CommonModule

@main
@MainActor
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerDependencies()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        let loginFactory = InjectionContainer.shared.resolve(LoginFactory.self)
        guard let loginViewController = loginFactory?.makeLoginViewController() else { return true }
        
        window.rootViewController = UINavigationController(rootViewController: loginViewController)
        
        return true
    }
    
    private func registerDependencies() {
        let container = InjectionContainer.shared
        container.register(Routing.self) { _ in Router() }
        container.register(LoginFactory.self) { _ in LoginModuleFactory() }
        container.register(HomeFactory.self) { _ in HomeModuleFactory() }
    }
}

