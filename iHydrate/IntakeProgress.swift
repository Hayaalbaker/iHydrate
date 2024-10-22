//
//  IntakeProgress.swift
//  iHydrate
//
//  Created by Haya Albaker on 22/10/2024.
//

import SwiftUI

struct IntakeProgress: View {
    @State private var waterIntake: Double = 0.05 // Start with a small value to show some progress
    let totalWaterGoal: Double = 2.7

    var body: some View {
        VStack {
            // Title with systemGray2 color
            Text("Today's Water Intake")
                .font(.headline)
                .foregroundColor(Color(UIColor.systemGray2)) // Set text color to systemGray2
                .padding(.top, 20)

            // Water Intake text
            Text("\(String(format: "%.1f", waterIntake)) liter / \(String(format: "%.1f", totalWaterGoal)) liter")
                .font(.title)
                .bold()
                .foregroundColor(waterIntake >= totalWaterGoal ? .green : .black)

            // Circular progress bar
            ZStack {
                // Inner circle
                Circle()
                    .stroke(Color(UIColor.systemGray6), lineWidth: 30)
                    .frame(width: 300, height: 300)

                // Outer progress ring with systemCyan color
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(waterIntake / totalWaterGoal, 1.0)))
                    .stroke(Color(UIColor.systemCyan), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                    .frame(width: 300, height: 300)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut(duration: 1), value: waterIntake) // Add smooth animation

                // Icon in the center of the circle with systemYellow color
                Image(systemName: iconForWaterIntake())
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(UIColor.systemYellow))
            }
            .padding()

            // Water intake in liters
            Text("\(String(format: "%.1f", waterIntake)) L")
                .font(.largeTitle)
                .bold()

            // Plus and minus buttons inside a rectangle with a vertical divider
            HStack(spacing: 0) { // Remove space to align the buttons next to each other
                Button(action: {
                    waterIntake = max(waterIntake - 0.1, 0.0) // Ensure value doesn't go below 0
                }) {
                    Image(systemName: "minus")
                        .frame(width: 18, height: 22)
                        .background(Color.clear) // Transparent background for the button
                        .foregroundColor(.black)
                        .padding()
                }

                Divider() // Divider between the buttons
                    .background(Color(UIColor.systemGray3))
                    .frame(width: 1, height: 18)
                
                Button(action: {
                    waterIntake = min(waterIntake + 0.1, totalWaterGoal) // Ensure value doesn't exceed goal
                }) {
                    Image(systemName: "plus")
                        .frame(width: 18, height: 22)
                        .background(Color.clear) // Transparent background for the button
                        .foregroundColor(.black)
                        .padding()
                }
            }
            .frame(width: 94, height: 44) // Rectangle dimensions
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(8) // Rounded corners
        }
        .padding()
    }

    // Function to get the correct icon based on water intake
    func iconForWaterIntake() -> String {
        switch waterIntake {
        case 0.0:
            return "zzz"
        case 0.1..<1.0:
            return "tortoise"
        case 1.0..<2.7:
            return "hare"
        default:
            return "hands.clap"
        }
    }
}

#Preview {
    IntakeProgress()
}
