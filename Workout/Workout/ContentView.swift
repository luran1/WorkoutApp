//
//  ContentView.swift
//  Workout
//
//  Created by Madison Francis on 2/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var workoutRoutines: [WorkoutRoutine] = [WorkoutRoutine.exampleWorkoutRoutine]
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(workoutRoutines, id: \.self){ workoutRoutine in
                    Text(workoutRoutine.name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
