//
//  MockData.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 24.06.2024.
//

import Foundation

struct MockData {

    static var steps: [HealthMetric] {
        var array: [HealthMetric] = []

        for i in 0..<28 {
            let metric = HealthMetric(
                date: Calendar.current.date(byAdding: .day, value: -i, to: .now)!,
                value: .random(in: 4_000...15_000))
            array.append(metric)
        }
        return array
    }

    static var weights: [HealthMetric] {
        var array: [HealthMetric] = []

        for i in 0..<28 {
            let metric = HealthMetric(
                date: Calendar.current.date(byAdding: .day, value: -i, to: .now)!,
                value: .random(in: (160 + Double(i/3)...165 + Double(i/3))))
            array.append(metric)
        }
        return array
    }
}
