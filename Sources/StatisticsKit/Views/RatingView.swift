//
//  RatingView.swift
//  StatisticsKit
//
//  Created by Agata Przykaza on 21/06/2025.
//

import SwiftUI
import Charts

struct RatingView: View {
    let ratings: [(Int, Int)]
    
    public init(ratings: [(Int, Int)]) {
        self.ratings = ratings
    }
    
    private var sortedRatings: [(Int, Int)] {
        ratings.sorted(by: { $0.0 > $1.0 })
    }
    
    private var maxCount: Int {
        ratings.map { $0.1 }.max() ?? 0
    }
    
    public var body: some View {
        Chart(sortedRatings, id: \.0) { rating in
                    BarMark(
                        x: .value("Liczba książek", rating.1),
                        y: .value("Ocena", "\(rating.0) ⭐")
                    )
                    .foregroundStyle(ChartConstants.Colors.bluePink)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                }
                .chartXScale(domain: 0...(maxCount + 2))
                .chartXAxis {
                    AxisMarks(values: .stride(by: 5))
                }
                .chartYAxis {
                    AxisMarks(position: .leading) {
                        AxisGridLine(centered: false)
                                    .foregroundStyle(.gray.opacity(0.2))
                        AxisValueLabel()
                    }
                
                }
            }
    
    
}

#Preview {
    RatingView(ratings: [
                        (5, 15),
                        (4, 25),
                        (3, 8),
                        (2, 3),
                        (1, 0)
                    ])
                    .frame(height: 200)
                    .padding()
}
