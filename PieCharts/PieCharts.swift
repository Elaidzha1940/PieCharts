//  /*
//
//  Project: PieCharts
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 29.12.2023
//
//  */

import SwiftUI
import Charts

struct PieCharts: View {
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Chart {
                    ForEach(MockData.revenueSreams) { stream in
                        SectorMark(angle: .value("Stream", stream.value), innerRadius: 100,
                                   outerRadius: 100,
                                   angularInset: 1.0)
                        // SectorMark(angle: .value("Stream", stream.value), angularInset: 3)
                        //.foregroundStyle(.mint)
                        .foregroundStyle(by: .value("Name", stream.name))
                    }
                }
                //.chartLegend(.hidden)
            }
            .padding()
            .navigationTitle("Revenue")
        }
    }
}

#Preview {
    PieCharts()
}

struct RevenueSream: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
}

struct MockData {
    static var revenueSreams: [RevenueSream] = [
        .init(name: "Adsense", value: 808),
        .init(name: "Courses", value: 2500),
        .init(name: "Sponsors", value: 3460),
        .init(name: "Cosulting", value: 4900),
        .init(name: "Cryptocurrency", value: 7500),
    ]
}
