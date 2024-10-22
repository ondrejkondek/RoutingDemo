// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI


// MARK: - Option 1 - observable singleton - must be on MainActor
@MainActor
public class AuthObserver: ObservableObject {
    public static let shared: AuthObserver = AuthObserver()
    
    @Published public var isLoggedIn: Bool = false
    @Published public var text = "Texgtwetasdg"
    
    public init() {}
    
    @MainActor public func fetch() async -> [Post] {
        do {
            let posts = try await TestAPI().fetchPosts()
            return posts
        } catch {
            return []
        }
    }
}

// MARK: - Option 2 - actor singleton - can be multi threaded access - no observation by default
final public actor AuthManager {
    public static let shared: AuthManager = AuthManager()
    
    public private(set) var isLoggedIn: Bool
    
    private init() {
        self.isLoggedIn = false
    }
    
    public func login() {
        self.isLoggedIn = true
    }
    
    public func logout() {
        self.isLoggedIn = false
    }
}
