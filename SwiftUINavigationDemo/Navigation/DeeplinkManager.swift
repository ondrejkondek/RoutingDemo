//
//  DeeplinkManager.swift
//  SwiftUINavigationDemo
//
//  Created by Ondrej Kondek on 21/10/2024.
//

import SwiftUI

// MARK: - this is not used yet - might be used for saving deeplinks which have to be executed later
actor DeeplinkManager {
    @MainActor
    static let shared: DeeplinkManager = DeeplinkManager()
    
    public private(set) var deeplink: Deeplink?
    
    public func saveDeeplink(deeplink: Deeplink) {
        self.deeplink = deeplink
    }
    
    public func clearDeeplink() {
        self.deeplink = nil
    }
}
