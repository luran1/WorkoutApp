//
//  ContentView.swift
//  Workout
//
//  Created by Madison Francis on 2/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var workoutRoutines: [WorkoutRoutine] = [WorkoutRoutine.exampleWorkoutRoutine]
    @State private var path = NavigationPath()
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
            .navigationDestination(for: WorkoutRoutine.self){workout in
                WorkoutDetailsView(workout: workout)
            }
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    NavigationLink(destination: AddNewWorkoutRoutineView(), label: {Label("Add new workout Routine", systemImage: "plus")})
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
