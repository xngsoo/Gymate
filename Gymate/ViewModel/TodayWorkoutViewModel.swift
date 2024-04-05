//
//  WorkoutViewModel.swift
//  Gymate
//
//  Created by Han on 4/1/24.
//

import Foundation

class TodayWorkoutViewModel: ObservableObject {
    @Published var todayWorkouts: [WorkOut] = []
    
    func fetchTodayWorkouts() {
        
    }
}
