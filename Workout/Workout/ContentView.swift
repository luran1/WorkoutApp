//
//  ContentView.swift
//  Workout
//
//  Created by Madison Francis on 2/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var workoutRoutines: [WorkoutRoutine] = [WorkoutRoutine.exampleWorkoutRoutine]
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            ScrollView{
                LazyVStack{
                    ForEach(workoutRoutines, id: \.self){ workoutRoutine in
                        NavigationLink(value: workoutRoutine) {
                            Text(workoutRoutine.name)
                        }
                        }
                    }
                }
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    NavigationLink(value: "AddNewWorkout"){
                        Label("add new workout", systemImage: "plus")
                    }
                }
            }
            .navigationDestination(for: String.self){addWorkout in
                AddExerciseSelectionView(path: $path)
            }
            .navigationDestination(for: WorkoutRoutine.self){workout in
                WorkoutDetailsView(workout: workout)

            }
            .navigationDestination(for: [Exercise].self){SelectedExercises in
                AddNewWorkoutRoutineView(newWorkout: SelectedExercises, path: $path)

            }
        }
    }
}

#Preview {
    ContentView()
}
