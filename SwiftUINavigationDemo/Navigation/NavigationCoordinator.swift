//
//  NavigationCoordinator.swift
//  SwiftUINavigationDemo
//
//  Created by Ondrej Kondek on 17/10/2024.
//

import SwiftUI
import Common

class NavigationCoordinator: ObservableObject {
    @Published var selectedTab: NavigationStoreId = .tab1
    var tabNavigationStores: [(id: NavigationStoreId, store: NavigationStore)] = []
    
    let loginNavigationStore: NavigationStore
    
    init(loginNavigationStore: NavigationStore) {
        self.loginNavigationStore = loginNavigationStore
    }
    
    @MainActor func readDeeplink(deeplink: Deeplink) {
        if let navigationStore = getTabNavigationStore(for: deeplink) {
            selectedTab = navigationStore.id
            Task {
                await navigationStore.store.readDeeplink(deeplink: deeplink)
            }
        }
        // TODO: login, menu stores ...
    }
    
    private func getTabNavigationStore(for deeplink: Deeplink) -> (id: NavigationStoreId, store: NavigationStore)? {
        tabNavigationStores.first(where: { $0.id == deeplink.storeId })
    }
}
