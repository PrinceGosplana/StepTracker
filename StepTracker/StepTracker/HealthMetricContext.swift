//
//  HealthMetricContext.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 15.06.2024.
//


enum HealthMetricContext: CaseIterable, Identifiable {
    case steps, weight

    var id: Self { self }
    
    var title: String {
        switch self {
        case .steps: "Steps"
        case .weight: "Weight"
        }
    }
}
