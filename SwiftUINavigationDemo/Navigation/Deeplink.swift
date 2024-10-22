//
//  Deeplink.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 26.01.2024.
//

import Common
import Foundation

public enum Deeplink: Sendable {
    case prefilledArticleDetail(articleId: String, voucherCode: String)
    case authorizedLogin
    
    var storeId: NavigationStoreId {
        switch self {
        case .prefilledArticleDetail(articleId: _, voucherCode: _):
            return .tab2
        case .authorizedLogin:
            return .tab1
        }
    }
    
    static func mapDeeplink(deeplinkString: String, userInfo: [AnyHashable: Any]) -> Deeplink? {
        switch deeplinkString {
        case "authorizedLogin":
            return .authorizedLogin
        
        case "prefilledArticleDetail":
            // Assuming articleId and voucherCode are present in the userInfo dictionary
//            if let articleId = userInfo["articleId"] as? String,
//               let voucherCode = userInfo["voucherCode"] as? String {
            return .prefilledArticleDetail(articleId: "articleId", voucherCode: "voucherCode")
        default:
            return nil
        }
    }
}
