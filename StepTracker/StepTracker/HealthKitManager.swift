//
//  HealthKitManager.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 16.06.2024.
//

import Foundation
import HealthKit
import Observation

@Observable final class HealthKitManager {
    let store = HKHealthStore()

    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
