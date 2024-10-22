//
//  ContentView.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Common
import SwiftUI
import AuthManager
import Login

struct ContentView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    @State private var isLoggedIn: Bool = false // option 2
    @StateObject private var authObserver = AuthObserver.shared // option 1
    
    var body: some View {
//        if isLoggedIn { // option 2
        if authObserver.isLoggedIn {
            TabView(selection: $coordinator.selectedTab) {
                ZStack {
                    NavRootView(navigationStore: coordinator.tabNavigationStores[0].store)
                    
                    deeplinkFAB
                    deeplinkLoginTest
                    logout
                }
                .tabItem {
                    Text("Tab1")
                }
                .tag(coordinator.tabNavigationStores[0].id)
                
                NavRootView(navigationStore: coordinator.tabNavigationStores[1].store)
                    .tabItem {
                        Text("Tab2")
                    }
                    .tag(coordinator.tabNavigationStores[1].id)
            }
            .onChange(of: coordinator.selectedTab) { tab in
                print(tab)
            }
            .environmentObject(authObserver)

        } else {
            ZStack {
                NavRootView(navigationStore: coordinator.loginNavigationStore)
                // option 2
                //                .task {
                //                    isLoggedIn = await AuthManager.shared.isLoggedIn
                //                    coordinator.loginNavigationStore.rootNode = LoginNode { isLoggedIn in
                //                        self.isLoggedIn = isLoggedIn
                //                    }
                //                }
            }
                .environmentObject(authObserver)
        }
    }
    
    var deeplinkFAB: some View {
        Circle()
            .fill(.black)
            .overlay(
                Text("deeplink")
                    .foregroundColor(.white)
            )
            .frame(width: 80, height: 80)
            .padding()
            .onTapGesture {
                coordinator.readDeeplink(
                    deeplink: Deeplink.prefilledArticleDetail(
                        articleId: "id1",
                        voucherCode: "123456789"
                    )
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
    
    var logout: some View {
        Circle()
            .fill(.black)
            .overlay(
                Text("logout")
                    .foregroundColor(.white)
            )
            .frame(width: 80, height: 80)
            .padding()
            .onTapGesture {
                Task{ @MainActor in
                    try await Task.sleep(nanoseconds: 1000000000)
                    
                    authObserver.isLoggedIn = false // option 1
                    await AuthManager.shared.logout() // option 2
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
    
    var deeplinkLoginTest: some View {
        Circle()
            .fill(.black)
            .overlay(
                Text("deeplink Login test")
                    .foregroundColor(.white)
            )
            .frame(width: 80, height: 80)
            .padding()
            .onTapGesture {
                coordinator.readDeeplink(
                    deeplink: Deeplink.authorizedLogin
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationCoordinator(
            loginNavigationStore: LoginNavigationStore(
                rootNode: LoginNode(),
                parentNavigationStore: nil
            )
        ))
}
