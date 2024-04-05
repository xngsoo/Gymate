//
//  WorkOut.swift
//  Gymate
//
//  Created by Han on 3/26/24.
//

import Foundation

struct WorkOut: Identifiable {
    var id = UUID()
    var workoutName: String
    var repsPerSet: Int
    var totalSet: Int
    //var runningTime: Date
}
