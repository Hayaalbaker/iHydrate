//
//  OnboardingVM.swift
//  iHydrate
//
//  Created by Haya Albaker on 24/10/2024.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var bodyWeight: String = ""

    var dailyWaterIntake: Double {
        if let weight = Double(bodyWeight) {
            return weight * 0.03
        }
        return 0.0
    }
}
