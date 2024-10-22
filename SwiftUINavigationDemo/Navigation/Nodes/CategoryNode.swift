//
//  CategoryNode.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Common
import Foundation
import AuthManager

struct CategoryNode: Node { 
    func handleDeeplink(deeplink: Any, navigationStore: NavigationStore) -> Bool {
        guard let deeplink = deeplink as? Deeplink else { return false }
        switch deeplink {
        case .prefilledArticleDetail:
            handlePrefilledArticleDetailDeeplink(
                deeplink: deeplink,
                navigationStore: navigationStore
            )
            return true
        case .authorizedLogin:
            return false
        }
    }
    
    func handleNavigationEvent(event: Any, navigationStore: NavigationStore) -> Bool {
        guard let navigationEvent = event as? NavigationEvent else { return false }
        switch navigationEvent {
        case .toHome:
            return false
        case .toCategories:
            navigationStore.popToNode(node: self)
            return true
        }
    }
}

extension CategoryNode {
    func handlePrefilledArticleDetailDeeplink(
        deeplink: Deeplink,
        navigationStore: NavigationStore
    ) {
        guard case let .prefilledArticleDetail(articleId, voucher) = deeplink else { return }

        let articleNode = ArticleDetailNode(
            articleId: articleId,
            prefilledVoucher: voucher
        )
        navigationStore.navigationPath.append(articleNode)
        _ = articleNode.handleDeeplink(deeplink: deeplink, navigationStore: navigationStore)
    }
}
