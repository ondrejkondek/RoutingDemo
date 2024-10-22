//
//  HomescreenRouter.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import SwiftUI

@MainActor public protocol HomescreenRouterLogic: AnyObject {
    func navigate(_ route: HomescreenRoute)
}

public enum HomescreenRoute: Hashable {
    case categories
    case login
}

class DefaultHomescreenRouter: HomescreenRouterLogic {
    public func navigate(_ route: HomescreenRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var homescreenRouter: HomescreenRouterLogic {
        get { self[HomescreenRouterKey.self] }
        set { self[HomescreenRouterKey.self] = newValue }
    }
}

struct HomescreenRouterKey: EnvironmentKey {
    @MainActor static var defaultValue: HomescreenRouterLogic {
        DefaultHomescreenRouter()
    }
}
