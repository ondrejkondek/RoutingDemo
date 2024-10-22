//
//  DestinationFactory.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Categories
import Common
import Foundation
import Homescreen
import SwiftUI
import Login
import Article
import Filter
import Homescreen
import Categories

@MainActor
public struct ViewFactory {
    private let navigationStore: NavigationStore
    
    public init(navigationStore: NavigationStore) {
        self.navigationStore = navigationStore
    }
    
    @ViewBuilder
    func getView(for node: any Node) -> some View {
        switch node {
        case is HomescreenNode:
            HomescreenView()
        case is CategoryNode:
            CategoriesView(router: navigationStore)
        case let node as ArticleDetailNode:
            ArticleDetailView()
                .environmentObject(ArticleDetailVM(prefilledVoucher: node.prefilledVoucher))
        case is FilterNode:
            FilterView()
        case is FilterTagCollectionNode:
            FilterTagCollectionView()
        case let node as LoginNode:
            LoginView(router: navigationStore, completion: node.completion)
        default:
            Text("Error: No Destination")
        }
    }
    
    @ViewBuilder
    func getView(for node: AnyHashable) -> some View {
        if let node = node as? any Node {
            getView(for: node)
        } else {
            Text("Error: Not conforming to node")
        }
    }
}
