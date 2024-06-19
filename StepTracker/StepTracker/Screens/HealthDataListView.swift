//
//  HealthDataListView.swift
//  StepTracker
//
//  Created by Oleksandr Isaiev on 15.06.2024.
//

import SwiftUI

struct HealthDataListView: View {

    @State private var isShowingAddData = false
    @State private var addDataDate: Date = .now
    @State private var valueToAdd: String = ""

    var metric: HealthMetricContext
    
    var body: some View {
        List(0..<28) { i in
            HStack {
                Text(Date(), format: .dateTime.month().day().year())
                Spacer()
                Text(1_000, format: .number.precision(.fractionLength(metric == .steps ? 0 : 1)))
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isShowingAddData) {
            addDataView
                .presentationDetents([.height(190)])
                .presentationCornerRadius(25)
        }
        .toolbar {
            Button("Add Data", systemImage: "plus") {
                isShowingAddData.toggle()
            }
        }
    }

    var addDataView: some View {
        NavigationStack {
            Form {
                DatePicker("Date", selection: $addDataDate, displayedComponents: .date)
                HStack {
                    Text(metric.title)
                    Spacer()
                    TextField("Value", text: $valueToAdd)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 140)
                        .keyboardType(metric == .steps ? .numberPad : .decimalPad)
                }
            }
            .navigationTitle(metric.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Data") {

                    }
                }

                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss") {
                        isShowingAddData.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDataListView(metric: .weight)
    }
}
