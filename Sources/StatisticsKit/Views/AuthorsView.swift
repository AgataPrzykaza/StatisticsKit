//
//  SwiftUIView.swift
//  StatisticsKit
//
//  Created by Agata Przykaza on 13/06/2025.
//

import SwiftUI
import Charts

struct AuthorsView: View {
    let favoriteAuthors: [(String, Int)]
    
    public init(favoriteAuthors: [(String, Int)]) {
        self.favoriteAuthors = favoriteAuthors
    }
    
    public var body: some View {
        Chart(favoriteAuthors.sorted(by: { $0.1 > $1.1 }), id: \.0) { author in
            BarMark(
                x: .value("Książki", author.1),
                y: .value("Autor", author.0)
            )
            .foregroundStyle(ChartConstants.Colors.bluePink)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .annotation(position: .overlay, alignment: .trailing) {
                Text("\(author.1) książek")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(ChartConstants.Colors.textOnChart)
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis {
            AxisMarks(position: .leading) { _ in
                AxisValueLabel()
            }
        }
    }
}

#if DEBUG
struct MinimalAuthorsChart_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsView(favoriteAuthors: [
            ("Andrzej Sapkowski", 8),
            ("George Orwell", 5),
            ("Frank Herbert", 4),
            ("Isaac Asimov", 6),
            ("Terry Pratchett", 3)
        ])
        .frame(height: 250)
        .padding()
    }
}
#endif
