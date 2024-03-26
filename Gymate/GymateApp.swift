//
//  GymateApp.swift
//  Gymate
//
//  Created by Han on 3/26/24.
//

import SwiftUI
import Firebase
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct GymateApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    if let _ = Auth.auth().currentUser {
                        // 로그인된 사용자가 있다면 로그인 상태로 전환
                        UserDefaults.standard.set(true, forKey: "isSignIn")
                    } else {
                        // 로그인된 사용자가 없다면 로그아웃 상태로 전환
                        UserDefaults.standard.set(false, forKey: "isSignIn")
                    }
                }
        }
    }
}
