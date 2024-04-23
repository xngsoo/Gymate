//
//  WorkoutService.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import Foundation

class WorkoutService {
    func fetchWorkouts() async throws -> [Workout] {
        return MockupPreview().workouts
    }
}
