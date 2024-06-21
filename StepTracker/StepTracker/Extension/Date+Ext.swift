//
//  Date+Ext.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 20.06.2024.
//

import Foundation

extension Date {
    var weekdayInt: Int {
        Calendar.current.component(.weekday, from: self)
    }

    var weekdayTitle: String {
        self.formatted(.dateTime.weekday(.wide))
    }
}
