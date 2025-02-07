//
//  WorkoutRoutineObj.swift
//  Workout
//
//  Created by Madison Francis on 2/6/25.
//

import Foundation

class WorkoutRoutine: Identifiable {
    var id=UUID()
    var name: String
    var exercises: [Exercise]

    init(id: UUID = UUID(), name: String, exercises: [Exercise]) {
        self.id = id
        self.name = name
        self.exercises = exercises
    }
    func addExcercise(_ newExercise: Exercise){
        exercises.append(newExercise)
    }
    func changeName(to newName: String){
        name = newName
    }
    func removeExercise(_ exercise: Exercise){
        exercises.removeAll(where: {$0.id == exercise.id})
    }
    func moveExercise(_ exercise: Exercise,to newIndex: Int){
        if newIndex > -1 && newIndex < exercises.count {
            guard let index = exercises.firstIndex(where: {$0.id == exercise.id}) else {
                return
            }
            var temp = exercises.remove(at: index)
            exercises.insert(temp, at: newIndex)
        }
    }
}

class Exercise: Identifiable {
    var id=UUID()
    var name: String
    var sets: [ExerciseSet]
    var useRestTimer: Bool = false
    var restTimer:Int=0
    
    init(id: UUID = UUID(), name: String, sets: [ExerciseSet], useRestTimer: Bool, restTimer: Int) {
        self.id = id
        self.name = name
        self.sets = sets
        self.useRestTimer = useRestTimer
        self.restTimer = restTimer
    }
    func addSet(_ newSet: ExerciseSet){
        sets.append(newSet)
    }
    func changeRestTime(to newTime:Int){
        restTimer = newTime
    }
    func toggleRestTimer(){
        useRestTimer = !useRestTimer
    }
}

class ExerciseSet: Identifiable{
    var id=UUID()
    var reps: Int
    var weight: Double
    var completed: Bool = false
    
    init(id: UUID = UUID(), reps: Int, weight: Double, completed: Bool) {
        self.id = id
        self.reps = reps
        self.weight = weight
        self.completed = completed
    }
    func changeReps(to newRepCount: Int){
        reps = newRepCount
    }
    func changeWeight(to newWeight: Double){
        weight = newWeight
    }
    func toggleCompleted(){
        completed = !completed
    }
}
