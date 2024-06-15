//
//  HealthMetricContext.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 15.06.2024.
//


enum HealthMetricContext {
    case steps, weight

    var title: String {
        switch self {
        case .steps: "Steps"
        case .weight: "Weight"
        }
    }
}
