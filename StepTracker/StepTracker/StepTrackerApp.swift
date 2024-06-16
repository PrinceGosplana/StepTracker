//
//  StepTrackerApp.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 15.06.2024.
//

import SwiftUI

@main
struct StepTrackerApp: App {

    let hkManager = HealthKitManager()

    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkManager)
        }
    }
}
