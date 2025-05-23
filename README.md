# Modular Dependency

A modular iOS/macOS Swift project demonstrating scalable dependency management and modular architecture for building feature-oriented applications. Each module is developed as a Swift Package, making the codebase maintainable, testable, and easy to extend.

## Features

- **Swift Package Manager-based Modularization:**  
  Separate modules like `LoginModule`, `HomeModule`, and `CommonModule` are organized as independent Swift Packages.
- **Dependency Injection:**  
  Centralized and type-safe DI using [Swinject](https://github.com/Swinject/Swinject) via the `InjectionContainer` for decoupling and testability.
- **Reusable Shared Utilities:**  
  Common utility extensions for `UIColor` and `UIView` are provided in the `UtilityModule`.
- **Feature Isolation:**  
  Each feature module (e.g., Home, Login) contains its own UI, logic, and tests, and depends only on shared modules.
- **Routing & Navigation:**  
  Central `Router` routes between features, making navigation modular and maintainable.

## Project Structure

```
ModularDependency/
├── App/                  # Application entry point & AppDelegate
│
├── Modules/
│   ├── CommonModule/     # Dependency injection, protocols, shared interfaces
│   ├── HomeModule/       # Home feature (UI, logic, factory)
│   └── LoginModule/      # Login feature (UI, logic, factory)
│
└── Shared/
    └── UtilityModule/    # Common UI extensions/utilities
```

### Key Modules

- **CommonModule:**  
  - Provides core protocols (`Routing`, `HomeFactory`, `LoginFactory`) and the `InjectionContainer` for dependency resolution.
- **LoginModule:**  
  - Implements login screen logic and UI, exposes `LoginModuleFactory`.
- **HomeModule:**  
  - Implements home screen logic and UI, exposes `HomeModuleFactory`.
- **UtilityModule:**  
  - UI helpers and extensions for `UIColor` and `UIView`.

## Getting Started

### Requirements

- Swift 6.1 or later
- Xcode 15 or later
- iOS 13+ / macOS 10.15+

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/trongtin1495/modular-dependency.git
    ```
2. Open `ModularDependency.xcodeproj` in Xcode.

3. Build and run the project.

### How It Works

- **AppDelegate** registers dependencies with the `InjectionContainer`.
- The app launches to the `LoginViewController` from the `LoginModule`.
- Login action triggers the router to navigate to the `HomeViewController`.
- All navigation and dependency resolution is handled through protocols and the shared container.

## Example

```swift
// Registering dependencies in AppDelegate
container.register(Routing.self) { _ in Router() }
container.register(LoginFactory.self) { _ in LoginModuleFactory() }
container.register(HomeFactory.self) { _ in HomeModuleFactory() }
```
```swift
// Navigating from Login to Home
@objc func didTapButton() {
    router?.routeToHome(baseViewController: self)
}
```

## Running Tests

Each module has its own test target. Run tests via Xcode's Test navigator.

## License

[MIT](LICENSE)

---

**Author:** [Tin Le](https://github.com/trongtin1495)
