//
//  ChartMath.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 20.06.2024.
//

import Algorithms
import Foundation

struct ChartMath {

    static func averageWeekdayCount(for metric: [HealthMetric]) -> [WeekdayChartData] {
        let sortedByWeekday = metric.sorted { $0.date.weekdayInt < $1.date.weekdayInt }
        let weekdayArray = sortedByWeekday
        return []
    }
}

