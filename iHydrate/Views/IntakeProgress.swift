//
//  IntakeProgress.swift
//  iHydrate
//
//  Created by Haya Albaker on 22/10/2024.
//

import SwiftUI

struct IntakeProgress: View {
    @StateObject private var viewModel: IntakeProgressViewModel

    init(totalWaterGoal: Double) {
        _viewModel = StateObject(wrappedValue: IntakeProgressViewModel(totalWaterGoal: totalWaterGoal))
    }

    var body: some View {
        VStack {
            header
            progressCircle
            controls
        }
        .padding()
    }

    private var header: some View {
        // Same as your original code, using viewModel.waterIntake and viewModel.totalWaterGoal
        VStack(alignment: .leading) {
            Text("Today's Water Intake")
                .font(.headline)
                .foregroundColor(Color(UIColor.systemGray2))
                .padding(.top, 20)

            Text("\(String(format: "%.1f", viewModel.waterIntake)) liter / \(String(format: "%.1f", viewModel.totalWaterGoal)) liter")
                .font(.title)
                .bold()
                .foregroundColor(viewModel.waterIntake >= viewModel.totalWaterGoal ? .green : .black)
            Spacer()
        }
        .padding(.leading) // Adjust padding to left align
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var progressCircle: some View {
        ZStack {
            Spacer()
            Circle()
                .stroke(Color(UIColor.systemGray6), lineWidth: 30)
                .frame(width: 300, height: 300)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(viewModel.waterIntake / viewModel.totalWaterGoal, 1.0)))
                .stroke(Color(UIColor.systemCyan), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: -90))
                .animation(.easeInOut(duration: 1), value: viewModel.waterIntake)

            Image(systemName: viewModel.iconForWaterIntake())
                .resizable()
                .scaledToFit()
                .frame(width: 122.07, height: 90)
                .foregroundColor(Color(UIColor.systemYellow))
        }
        .padding()
    }

    private var controls: some View {
        HStack(spacing: 0) {
            Button(action: viewModel.decreaseWaterIntake) {
                Image(systemName: "minus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 22)
                    .foregroundColor(.black)
                    .padding()
            }

            Divider()
                .background(Color(UIColor.systemGray3))
                .frame(width: 1, height: 18)
            
            Button(action: viewModel.increaseWaterIntake) {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 22)
                    .foregroundColor(.black)
                    .padding()
            }
        }
        .frame(width: 94, height: 32)
        .background(Color(UIColor.tertiarySystemFill))
        .cornerRadius(8)
    }
}

#Preview {
    IntakeProgress(totalWaterGoal: 2.7)
}
