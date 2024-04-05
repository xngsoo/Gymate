//
//  CustomTabView.swift
//  Gymate
//
//  Created by Han on 4/1/24.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    @Binding var isShowAddTodayWorkSheet: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                selectedTab = .home
            } label: {
                VStack {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("home")
                        .foregroundStyle(.primary)
                }
                .foregroundStyle(selectedTab == .home ? .blue : .primary)
            }
            Spacer()
            Button {
                selectedTab = .todo
            } label: {
                VStack {
                    Image(systemName: "checklist.unchecked")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("todo")
                        .foregroundStyle(.primary)
                }
                .foregroundStyle(selectedTab == .todo ? .blue : .primary)
            }
            Spacer()
            Button {
                isShowAddTodayWorkSheet.toggle()
            } label: {
                ZStack {
                    Circle()
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 2)
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundStyle(.primary)
                        .frame(width: 72, height: 72)
                }
                .offset(y: -32)
            }
            .sheet(isPresented: $isShowAddTodayWorkSheet) {
                AddTodayWorkoutView()
                    .interactiveDismissDisabled()
            }
            .buttonStyle(TabButtonStyle())
            Spacer()
            Button {
                selectedTab = .calender
            } label: {
                VStack {
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("calender")
                        .foregroundStyle(.primary)
                }
                .foregroundStyle(selectedTab == .calender ? .blue : .primary)
            }
            Spacer()
            Button {
                selectedTab = .profile
            } label: {
                VStack {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("My")
                        .foregroundStyle(.primary)
                }
                .foregroundStyle(selectedTab == .profile ? .blue : .primary)
            }
            Spacer()
        }
    }
}

