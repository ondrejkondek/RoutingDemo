//
//  NavRootView.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Article
import Categories
import Common
import Filter
import Foundation
import Homescreen
import SwiftUI

public struct NavRootView: View {
    @ObservedObject private var navigationStore: NavigationStore

    init(navigationStore: NavigationStore) {
        self.navigationStore = navigationStore
    }

    public var body: some View {
        NavigationStack(
            path: .init(
                get: { navigationStore.navigationPath.map{AnyHashable($0)}},
                set: { input in
                    navigationStore.navigationPath = input.compactMap {
                        $0 as? any Node
                    }
                }
            )
        ) {
            ViewFactory(navigationStore: navigationStore).getView(for: navigationStore.rootNode)
                .navigationDestination(for: AnyHashable.self) { destination in
                    ViewFactory(navigationStore: navigationStore).getView(for: destination)
                }
        }
        .sheet(isPresented: .init(
            get: { navigationStore.childSheetNavigationStore != nil },
            set: { _ in navigationStore.childSheetNavigationStore = nil }
        )) {
            if let sheet = navigationStore.childSheetNavigationStore {
                NavRootView(navigationStore: sheet)
            }
        }
        .environment(\.homescreenRouter, navigationStore)
//        .environment(\.categoryRouter, navigationStore) - this is injected via constructor as an option 2
        .environment(\.articleDetailRouter, navigationStore)
        .environment(\.filterRouter, navigationStore)
        .environment(\.filterTagCollectionRouter, navigationStore)
    }
}
