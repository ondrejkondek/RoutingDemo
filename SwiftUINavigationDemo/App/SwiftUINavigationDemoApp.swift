//
//  SwiftUINavigationDemoApp.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import SwiftUI
import Common

@main
struct SwiftUINavigationDemoApp: App {
  
    @State private var coordinator = NavigationCoordinator(
        loginNavigationStore: LoginNavigationStore(
            rootNode: LoginNode(),
            parentNavigationStore: nil
        )
    )
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    init() {
        coordinator.setUp()
        appDelegate.coordinator = coordinator
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coordinator)
        }
    }
}

extension NavigationCoordinator {
    func setUp() {
        let tab1NavigationStore = Tab1NavigationStore(
            rootNode: HomescreenNode(),
            parentNavigationStore: nil
        )
        self.tabNavigationStores.append((id: .tab1, store: tab1NavigationStore))
        
        let tab2NavigationStore = Tab2NavigationStore(
            rootNode: HomescreenNode(),
            parentNavigationStore: nil
        )
        self.tabNavigationStores.append((id: .tab2, store: tab2NavigationStore))
    }
}
