//
//  WorkoutViewModel.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    
    @Published var workouts = [Workout]()
    private let service: WorkoutService
    
    init(service: WorkoutService) {
        self.service = service
        
        Task { await fetchWorkout() }
    }
    
    func fetchWorkout() async {
        do {
            self.workouts = try await service.fetchWorkouts()
        } catch {
            print("Error with fetch data : \(error.localizedDescription)")
        }
    }
    
}
