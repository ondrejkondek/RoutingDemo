// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

@MainActor
public protocol LoginRouterLogic: AnyObject {
    func navigate(_ route: LoginRoute)
}

public enum LoginRoute: Hashable {
    case next
}
 
class DefaultLoginRouter: LoginRouterLogic {
    public func navigate(_ route: LoginRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var loginRouter: LoginRouterLogic {
        get { self[LoginRouterKey.self] }
        set { self[LoginRouterKey.self] = newValue }
    }
}

struct LoginRouterKey: @preconcurrency EnvironmentKey {
    @MainActor static var defaultValue: LoginRouterLogic {
        DefaultLoginRouter()
    }
}
