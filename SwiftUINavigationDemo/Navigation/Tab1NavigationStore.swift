//
//  NavigationStore.swift
//  SwiftUINavigationDemo
//
//  Created by Ondrej Kondek on 15/10/2024.
//

import Login
import Common
import AuthManager
import SwiftUI

public final class Tab1NavigationStore: NavigationStore {
    // MARK: - Example of overriding default behavior - e.g. for login purposes/checks
//    @MainActor public override func readDeeplink(deeplink: Any) async {
//        if await AuthManager.shared.isLoggedIn {
//            handleDeeplink(deeplink: deeplink)
//        } else {
//            login(deeplink: deeplink as! Deeplink)
//        }
//    }
//    
//    @MainActor func login(deeplink: Any) {
//        navigationPath.append(LoginNode() { [weak self] _ in
//            Task {
//                await self?.readDeeplink(deeplink: deeplink)
//            }
//        })
//    }
}
