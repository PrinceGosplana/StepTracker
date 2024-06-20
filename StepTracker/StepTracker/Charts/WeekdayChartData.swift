//
//  WeekdayChartData.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 20.06.2024.
//

import Foundation

struct WeekdayChartData: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}
