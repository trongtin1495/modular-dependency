import UIKit
import Swinject

@MainActor
public protocol Routing: Sendable {
    func routeToHome(baseViewController: UIViewController?)
}

@MainActor
public protocol HomeFactory: Sendable {
    func makeHomeViewController() -> UIViewController
}

@MainActor
public protocol LoginFactory: Sendable {
    func makeLoginViewController() -> UIViewController
}

public final class InjectionContainer: @unchecked Sendable {
    public static let shared = InjectionContainer()
    
    private let container: Container
    
    private init() {
        self.container = Container()
    }
    
    public func register<Service>(_ serviceType: Service.Type, factory: @escaping (Resolver) -> Service) {
        container.register(serviceType, factory: factory)
    }
    
    @MainActor
    public func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return container.resolve(serviceType)
    }
    
    public func resolveSync<Service>(_ serviceType: Service.Type) -> Service? where Service: Sendable {
        return container.resolve(serviceType)
    }
}
