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
                        SectorMark(angle: .value("Stream", stream.value), 
                                   //innerRadius: .ratio(0.500),
                                   //outerRadius: stream.name == "Courses" ? 200 : 160,
                                   angularInset: 1.0)
                        // SectorMark(angle: .value("Stream", stream.value), angularInset: 3)
                        //.foregroundStyle(.mint)
                        .foregroundStyle(by: .value("Name", stream.name))
                    }
                }
                .chartLegend(.hidden)
                .frame(width: 350, height: 350)
            }
            .padding()
            .navigationTitle("Revenue")
            
            Spacer()
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
    let color: Color
}

struct MockData {
    static var revenueSreams: [RevenueSream] = [
        .init(name: "Adsense", value: 500, color: .mint),
        .init(name: "Courses", value: 1500, color: .teal),
        .init(name: "Cryptocurrency", value: 6500, color: .brown),
        .init(name: "Sponsors", value: 3500),
        .init(name: "Cosulting", value: 4500),
    ]
}
