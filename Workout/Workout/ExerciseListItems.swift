//
//  ExerciseListItems.swift
//  Workout
//
//  Created by Madison Francis on 2/8/25.
//

import Foundation

struct ExerciseListItems: Codable {
    let exercises: [ExerciseListItem]
}

struct ExerciseListItem: Codable, Identifiable {
    var id = UUID()
    let exercise: String
    let targetedMuscleGroup: String
    let musclesInvolved: [String]

    enum CodingKeys: String, CodingKey {
        case exercise
        case targetedMuscleGroup = "targeted_muscle_group"
        case musclesInvolved = "muscles_involved"
    }
}
