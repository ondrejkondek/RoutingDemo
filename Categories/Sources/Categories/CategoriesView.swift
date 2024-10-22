//
//  CategoriesView.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import SwiftUI
import AuthManager

public struct CategoriesView: View {
//    @Environment(\.categoryRouter) private var router: CategoriesRouterLogic
    private let router: CategoriesRouterLogic
    @State private var counter = 1
        
//    public init() {}
    
    public init(router: CategoriesRouterLogic) {
        self.router = router
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("CategoriesView")
                .font(.title)
            
            Spacer()
            
            Text("back")
                .onTapGesture {
                    router.navigate(.back)
                }
            
            Text("home")
                .onTapGesture {
                    router.navigate(.home)
                }
            
            Text("articleDetail")
                .onTapGesture {
                    router.navigate(.articleDetail(articleId: "123"))
                }
            
            Text("filter")
                .onTapGesture {
                    router.navigate(.filter)
                }
            
            Spacer()
            
            Text("counter: \(counter)")
                .onTapGesture {
                    counter += 1
                }
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.cyan)
        .task {
            // MARK: - Send a request after logging in
            if AuthObserver.shared.isLoggedIn {
                let posts = await AuthObserver.shared.fetch()
                print("XXXXXXXX", posts.first?.title)
            }
        }
    }
}
