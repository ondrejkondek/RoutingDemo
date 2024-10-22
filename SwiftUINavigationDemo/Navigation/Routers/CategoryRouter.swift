//
//  CategoryRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import Common
import Categories
import AuthManager

extension NavigationStore: CategoriesRouterLogic {
    public func navigate(_ route: CategoriesRoute) {
        switch route {
        case .home:
            handleNavigationEvent(event: NavigationEvent.toHome)
        case .back:
            // MARK: - this demonstrates how to handle 2 different destination for one "button"/Route
            if self is Tab1NavigationStore {
                _ = navigationPath.popLast()
            }
        case let .articleDetail(articleId):
            navigationPath.append(ArticleDetailNode(articleId: articleId))
        case .filter:
            openSheet(with: FilterNode())
        }
    }
}
