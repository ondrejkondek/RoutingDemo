//
//  LoginRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Ondrej Kondek on 16/10/2024.
//

import SwiftUI
import Login
import Common

extension NavigationStore: LoginRouterLogic {
    public func navigate(_ route: LoginRoute) {
        switch route {
        case .next:
            navigationPath.append(CategoryNode())
        }
    }
}
