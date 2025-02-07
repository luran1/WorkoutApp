//
//  WorkoutRoutineObj.swift
//  Workout
//
//  Created by Madison Francis on 2/6/25.
//

import Foundation

class WorkoutRoutine: Identifiable, Hashable {
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
            let temp = exercises.remove(at: index)
            exercises.insert(temp, at: newIndex)
        }
    }
    static func == (lhs: WorkoutRoutine, rhs: WorkoutRoutine) -> Bool {
            return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static let exampleWorkoutRoutine = WorkoutRoutine(name: "Legs and Arms Routine", exercises: [Exercise.squat, Exercise.benchPress, Exercise.deadlift, Exercise.bicepCurl])


}

class Exercise: Identifiable, Hashable {
    var id=UUID()
    var name: String
    var notes: String
    var weightType: String = "lb"
    var sets: [ExerciseSet]
    var useRestTimer: Bool = false
    var restTimer:Int=0
    
    init(id: UUID = UUID(), name: String, notes: String, weightType: String, sets: [ExerciseSet], useRestTimer: Bool, restTimer: Int) {
        self.id = id
        self.name = name
        self.notes = notes
        self.weightType = weightType
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
    func togglePoundsAndKillograms(){
        if weightType=="lb" {
            weightType="Kg"
        } else {
            weightType="lb"
        }
    }
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
            return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static let squat = Exercise(name: "Squat", notes: "", weightType: "lb", sets: [ExerciseSet.squatSet1, ExerciseSet.squatSet2], useRestTimer: true, restTimer: 90)
    static let benchPress = Exercise(name: "Bench Press", notes: "", weightType: "lb", sets: [ExerciseSet.benchPressSet1, ExerciseSet.benchPressSet2], useRestTimer: true, restTimer: 60)
    static let deadlift = Exercise(name: "Deadlift", notes: "", weightType: "lb", sets: [ExerciseSet.deadliftSet1, ExerciseSet.deadliftSet2], useRestTimer: true, restTimer: 120)
    static let bicepCurl = Exercise(name: "Bicep Curl", notes: "", weightType: "lb", sets: [ExerciseSet.bicepCurlSet1, ExerciseSet.bicepCurlSet2], useRestTimer: false, restTimer: 0)


}

class ExerciseSet: Identifiable, Hashable{
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
    static func == (lhs: ExerciseSet, rhs: ExerciseSet) -> Bool {
            return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static let squatSet1 = ExerciseSet(reps: 10, weight: 100, completed: false)
    static let squatSet2 = ExerciseSet(reps: 8, weight: 110, completed: false)

    static let benchPressSet1 = ExerciseSet(reps: 12, weight: 80, completed: false)
    static let benchPressSet2 = ExerciseSet(reps: 10, weight: 85, completed: false)

    static let deadliftSet1 = ExerciseSet(reps: 6, weight: 120, completed: false)
    static let deadliftSet2 = ExerciseSet(reps: 5, weight: 130, completed: false)

    static let bicepCurlSet1 = ExerciseSet(reps: 15, weight: 25, completed: false)
    static let bicepCurlSet2 = ExerciseSet(reps: 12, weight: 30, completed: false)

}


