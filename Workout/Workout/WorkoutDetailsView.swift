//
//  WorkoutDetailsView.swift
//  Workout
//
//  Created by Madison Francis on 2/6/25.
//

import SwiftUI

struct WorkoutDetailsView: View {
    @State var workout: WorkoutRoutine
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(workout.exercises, id: \.self){ exercise in
                        Text(exercise.name)
                        Text(exercise.notes.isEmpty ? "Exercise notes" : exercise.notes)
                            .foregroundStyle(.secondary)
                        VStack{
                            HStack{
                                Text("Set")
                                Text("Weight(\(exercise.weightType))")
                                Text("Reps")
                            }
                            ForEach(exercise.sets.indices){exerciseSetIndex in
                                HStack{
                                    Text("\(exerciseSetIndex+1)")
                                    Text(String(format: "%.1f", exercise.sets[exerciseSetIndex].weight))
                                    Text("\(exercise.sets[exerciseSetIndex].reps)")
                                    Button {
                                        exercise.sets[exerciseSetIndex].toggleCompleted()
                                    } label: {
                                        Image(systemName: exercise.sets[exerciseSetIndex].completed ? "checkmark.circle.fill" : "checkmark.circle")
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(workout.name)
        }
    }
}

#Preview {
    WorkoutDetailsView(workout: WorkoutRoutine.exampleWorkoutRoutine)
}
