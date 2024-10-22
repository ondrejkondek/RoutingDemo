//
//  AppDelegate.swift
//  SwiftUINavigationDemo
//
//  Created by Ondrej Kondek on 16/10/2024.
//

import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, @preconcurrency UNUserNotificationCenterDelegate {
    
    weak var coordinator: NavigationCoordinator?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]

        Task {
            do {
                // https://developer.apple.com/forums/thread/764777
                let permission = try await UNUserNotificationCenter.current().requestAuthorization(options: authOptions)
                if permission {
                    UNUserNotificationCenter.current().delegate = self
                }
            } catch {
                print("there")
            }
        }

        UNUserNotificationCenter.current().delegate = self

        return true
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.list, .banner, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
      
        let userInfo = response.notification.request.content.userInfo

        if let deeplinkString = userInfo["deeplink"] as? String {
            
            // Try mapping the deeplink string to the Deeplink enum
            if let deeplink = Deeplink.mapDeeplink(deeplinkString: deeplinkString, userInfo: userInfo) {
                print(deeplink)
                
                if let coordinator {
                    coordinator.readDeeplink(deeplink: deeplink)
                }
            }
        }
        
        completionHandler()
    }
}
