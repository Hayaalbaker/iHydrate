//
//  IntakeProgress.swift
//  iHydrate
//
//  Created by Haya Albaker on 22/10/2024.
//

import SwiftUI

struct IntakeProgress: View {
    @State private var waterIntake: Double = 0.0
    let totalWaterGoal: Double = 2.7

    var body: some View {
        VStack {

            Text("Today's Water Intake")
                .font(.headline)
                .padding(.top, 20)

            Text("\(String(format: "%.1f", waterIntake)) liter / \(String(format: "%.1f", totalWaterGoal)) liter")
                .font(.title)
                .bold()
                .foregroundColor(waterIntake >= totalWaterGoal ? .green : .black)

            ZStack {
                Circle()
                    .stroke(Color(UIColor.systemGray6), lineWidth: 15)
                    .frame(width: 200, height: 200)

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(waterIntake / totalWaterGoal, 1.0)))
                    .stroke(Color(UIColor.systemCyan), lineWidth: 15)
                    .frame(width: 200, height: 200)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut, value: waterIntake)

                Image(systemName: iconForWaterIntake())
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(UIColor.systemYellow))
            }
            .padding()

            Text("\(String(format: "%.1f", waterIntake)) L")
                .font(.largeTitle)
                .bold()

            HStack {
                Button(action: {
                    if waterIntake > 0.0 {
                        waterIntake -= 0.1
                    }
                }) {
                    Image(systemName: "minus")
                        .frame(width: 44, height: 44)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }

                Button(action: {
                    if waterIntake < totalWaterGoal {
                        waterIntake += 0.1
                    }
                }) {
                    Image(systemName: "plus")
                        .frame(width: 44, height: 44)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }
            }
        }
        .padding()
    }

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

struct ContentView: View {
    var body: some View {
        IntakeProgress()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
