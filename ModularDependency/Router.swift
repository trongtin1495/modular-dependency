//
//  Router.swift
//  ModularDependency
//
//  Created by Tin Le on 22/5/25.
//

import UIKit
import CommonModule

@MainActor
final class Router: Routing {
    
    private var factory: HomeFactory?
    
    init() {
        factory = InjectionContainer.shared.resolve(HomeFactory.self)
    }
    
    func routeToHome(baseViewController: UIViewController?) {
        guard let homeVC = factory?.makeHomeViewController() else { return }
        baseViewController?.navigationController?.pushViewController(homeVC, animated: true)
    }
}

