//
//  IntakeProgress.swift
//  iHydrate
//
//  Created by Haya Albaker on 22/10/2024.
//

import SwiftUI

struct IntakeProgress: View {
    @State private var waterIntake: Double = 0.05
    let totalWaterGoal: Double = 2.7

    var body: some View {
        VStack {
            Text("Today's Water Intake")
                .font(.headline)
                .foregroundColor(Color(UIColor.systemGray2))
                .padding(.top, 20)

            
            Text("\(String(format: "%.1f", waterIntake)) liter / \(String(format: "%.1f", totalWaterGoal)) liter")
                .font(.title)
                .bold()
                .foregroundColor(waterIntake >= totalWaterGoal ? .green : .black)

            ZStack {
                Circle()
                    .stroke(Color(UIColor.systemGray6), lineWidth: 30)
                    .frame(width: 300, height: 300)

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(waterIntake / totalWaterGoal, 1.0)))
                    .stroke(Color(UIColor.systemCyan), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                    .frame(width: 300, height: 300)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut(duration: 1), value: waterIntake)

                Image(systemName: iconForWaterIntake())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 122.07, height: 90)
                    .foregroundColor(Color(UIColor.systemYellow))
            }
            .padding()

            Text("\(String(format: "%.1f", waterIntake)) L")
                .font(.largeTitle)
                .bold()

            HStack(spacing: 0) {
                Button(action: {
                    waterIntake = max(waterIntake - 0.1, 0.0)
                }) {
                    Image(systemName: "minus")
                        .frame(width: 18, height: 22)
                        .background(Color.clear)
                        .foregroundColor(.black)
                        .padding()
                }

                Divider()
                    .background(Color(UIColor.systemGray3))
                    .frame(width: 1, height: 18)
                
                Button(action: {
                    waterIntake = min(waterIntake + 0.1, totalWaterGoal)
                }) {
                    Image(systemName: "plus")
                        .frame(width: 18, height: 22)
                        .background(Color.clear)
                        .foregroundColor(.black)
                        .padding()
                }
            }
            .frame(width: 94, height: 44)
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(8)
        }
        .padding()
    }

    func iconForWaterIntake() -> String {
        switch waterIntake {
        case 0.0:
            return "zzz.fill"
        case 0.1..<1.0:
            return "tortoise.fill"
        case 1.0..<2.7:
            return "hare.fill"
        default:
            return "hands.clap.fill" 
        }
    }
}

#Preview {
    IntakeProgress()
}
