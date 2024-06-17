//
//  DashboardView.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 15.06.2024.
//

import Charts
import SwiftUI

struct DashboardView: View {
    @Environment(HealthKitManager.self) private var hkManager
    @AppStorage("hasSeenPermissionPriming") private var hasSeenPermissionPriming = false
    @State private var isShowingPermissionPrimingSheet = false
    @State private var selectedStat: HealthMetricContext = .steps
    var isSteps: Bool { selectedStat == .steps}

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {

                    Picker("Selected Stat", selection: $selectedStat) {
                        ForEach(HealthMetricContext.allCases) {
                            Text($0.title)
                        }
                    }
                    .pickerStyle(.segmented)

                    VStack {
                        NavigationLink(value: selectedStat) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Label("Steps", systemImage: "figure.walk")
                                        .font(.title3.bold())
                                        .foregroundStyle(.pink)

                                    Text("Avg: 18K Steps")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.bottom, 12)

                        Chart {
                            ForEach(hkManager.stepData) { steps in
                                BarMark(
                                    x: .value("Date", steps.date, unit: .day),
                                    y: .value("Steps", steps.value)
                                )
                            }
                        }
                        .frame(height: 150)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))

                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Label("Averages", systemImage: "calendar")
                                .font(.title3.bold())
                                .foregroundStyle(.pink)

                            Text("Last 28 Days")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.bottom, 12)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 240 )
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                }
            }
            .padding()
            .onAppear {
                isShowingPermissionPrimingSheet = !hasSeenPermissionPriming
            }
            .task {
                await hkManager.fetchStepCount()
            }
            .navigationTitle("Dashboard")
            .navigationDestination(for: HealthMetricContext.self) { metric in
                HealthDataListView(metric: metric)
            }
            .sheet(isPresented: $isShowingPermissionPrimingSheet) {

            } content: {
                HealthKitPermissionPrimingView(hasSeen: $hasSeenPermissionPriming)
            }

        }
        .tint(isSteps ? .pink : .indigo)
    }
}

//#Preview {
//    DashboardView()
//        .environment(HealthKitManager())
//}
 
