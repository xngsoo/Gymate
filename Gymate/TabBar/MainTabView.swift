//
//  MainTabView.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            WorkoutView()
                .tabItem{ Label("내 운동", systemImage: "dumbbell")}
            CalendarView()
                .tabItem{ Label("달력", systemImage: "calendar")}
            ProfileView()
                .tabItem{ Label("프로필", systemImage: "person")}
        }
    }
}

#Preview {
    MainTabView()
}
