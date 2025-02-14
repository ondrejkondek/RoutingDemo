//
//  HomescreenRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import Homescreen
import Common

extension NavigationStore: HomescreenRouterLogic {
    public func navigate(_ route: HomescreenRoute) {
        switch route {
        case .categories:
            navigationPath.append(CategoryNode())
        case .login:
            navigationPath.append(LoginNode())
        }
    }
}
