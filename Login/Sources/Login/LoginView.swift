//
//  LoginView.swift
//  AuthManager
//
//  Created by Ondrej Kondek on 15/10/2024.
//

import SwiftUI
import AuthManager

public struct LoginView: View {
    let completion: ((Bool) -> Void)?
    
    private let router: LoginRouterLogic
    
    @EnvironmentObject private var authObserver: AuthObserver // can be accessed from environment or as singleton
        
    public init(router: LoginRouterLogic, completion: ((Bool) -> Void)? = nil) {
        self.router = router
        self.completion = completion
    }
        
    public var body: some View {
        VStack {
            Text("Welcome to AuthManager")
            Button("Login") {
                Task {
                    AuthObserver.shared.isLoggedIn = true // option 1
                    await AuthManager.shared.login() // option 2
                }
            }
        }
    }
}
