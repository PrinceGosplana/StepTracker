//
//  WeightLineChart.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 24.06.2024.
//

import Charts
import SwiftUI

struct WeightLineChart: View {

    var selectedStat: HealthMetricContext
    var chartData: [HealthMetric]

    var body: some View {
        VStack {
            NavigationLink(value: selectedStat) {
                HStack {
                    VStack(alignment: .leading) {
                        Label("Weight", systemImage: "figure")
                            .font(.title3.bold())
                            .foregroundStyle(.indigo)

                        Text("Avg: 180 lbs")
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
                ForEach(chartData) { weights in

                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
    }
}

#Preview {
    WeightLineChart(selectedStat: .weight, chartData: HealthMetric.mockData)
}
