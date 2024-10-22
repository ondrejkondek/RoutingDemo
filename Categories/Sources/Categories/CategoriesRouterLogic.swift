//
//  CategoriesRouterLogic.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import SwiftUI

@MainActor
public protocol CategoriesRouterLogic: AnyObject {
    func navigate(_ route: CategoriesRoute)
}

public enum CategoriesRoute: Hashable {
    case home
    case back
    case articleDetail(articleId: String)
    case filter
}
 
//class DefaultCategoriesRouter: CategoriesRouterLogic {
//    public func navigate(_ route: CategoriesRoute) {
//        assertionFailure()
//    }
//    
//    public func navigateDeeplink() async {
//        assertionFailure()
//    }
//}
//
//public extension EnvironmentValues {
//    var categoryRouter: CategoriesRouterLogic {
//        get { self[CategoriesRouterKey.self] }
//        set { self[CategoriesRouterKey.self] = newValue }
//    }
//}
//
//struct CategoriesRouterKey: EnvironmentKey {
//    @MainActor static var defaultValue: CategoriesRouterLogic {
//        DefaultCategoriesRouter()
//    }
//}
//
