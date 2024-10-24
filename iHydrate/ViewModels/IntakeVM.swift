//
//  IntakeVM.swift
//  iHydrate
//
//  Created by Haya Albaker on 24/10/2024.
//

import Foundation

class IntakeProgressViewModel: ObservableObject {
    @Published var waterIntake: Double = 0.0
    let totalWaterGoal: Double

    init(totalWaterGoal: Double) {
        self.totalWaterGoal = totalWaterGoal
    }

    func decreaseWaterIntake() {
        waterIntake = max(waterIntake - 0.1, 0.0)
    }

    func increaseWaterIntake() {
        waterIntake = min(waterIntake + 0.1, totalWaterGoal)
    }
    
    func iconForWaterIntake() -> String {
        switch waterIntake {
        case 0.0:
            return "zzz"
        case 0.1..<1.0:
            return "tortoise.fill"
        case 1.0..<totalWaterGoal:
            return "hare.fill"
        default:
            return "hands.clap.fill"
        }
    }
}
