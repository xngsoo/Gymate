//
//  MainView.swift
//  Gymate
//
//  Created by Han on 3/26/24.
//

import SwiftUI

enum Tab {
    case todo
    case calender
    case home
    case profile
}

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}
struct ContentView: View {
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var selectedTab: Tab = .home
    @State private var isShowAddTodayWorkSheet: Bool = false
    
    var body: some View {
        if isLoggedIn {
            VStack {
                switch selectedTab {
                case .home:
                    NavigationStack {
                        HomeView()
                    }
                case .todo:
                    NavigationStack {
                        TodoView()
                    }
                case .calender:
                    NavigationStack {
                        CalenderView()
                    }
                case .profile:
                    NavigationStack {
                        ProfileView()
                    }
                }
                CustomTabView(selectedTab: $selectedTab,
                              isShowAddTodayWorkSheet: $isShowAddTodayWorkSheet)
                    .frame(height: 50)
            }
        } else {
            SignUpView()
        }
    }
}

#Preview {
    ContentView()
}
