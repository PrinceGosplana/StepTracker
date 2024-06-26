//
//  HealthMetric.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 16.06.2024.
//

import Foundation

struct HealthMetric: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}
