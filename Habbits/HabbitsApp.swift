//
//  HabbitsApp.swift
//  Habbits
//
//  Created by Ji y LEE on 5/12/25.
//

import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    let center = UNUserNotificationCenter.current()
    center.delegate = self
    center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
      if !granted { print("알림 권한 거부됨") }
    }
    return true
  }

 
}






@main
struct HabbitsApp: App {
    @StateObject var habbitListViewModel = HabbitListViewModel()
    init(){
        NotificationManager.shared.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(habbitListViewModel)
                .preferredColorScheme(.dark)
        }
        
    }
}
