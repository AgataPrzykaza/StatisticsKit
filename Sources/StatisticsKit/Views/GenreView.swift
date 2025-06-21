//
//  GenreView.swift
//  StatisticsKit
//
//  Created by Agata Przykaza on 21/06/2025.
//

import SwiftUI
import Charts

struct GenreView: View {
    let genres: [(String, Int)]
    
    private let primaryColor: Color = ChartConstants.Colors.bluePink
       private let secondaryColors: [Color] = [
        ChartConstants.Colors.bluePink.mix(with: .gray, by: 0.8),
             .gray.opacity(0.6),
             .gray.opacity(0.4),
             .gray.opacity(0.2),
             .gray.opacity(0.15),
             .gray.opacity(0.1)
       ]
       
       private var sortedGenres: [(String, Int)] {
           genres.sorted(by: { $0.1 > $1.1 })
       }
       
       private var totalBooks: Int {
           genres.reduce(0) { $0 + $1.1 }
       }
    
    var body: some View {
        HStack(alignment: .top,spacing: 50){
            Chart(sortedGenres, id: \.0) { genre in
                SectorMark(
                    angle: .value(genre.0, genre.1),
                    innerRadius: .ratio(0.4),
                    angularInset: 1.5
                )
                .foregroundStyle(colorForGenre(genre.0))
                .opacity(0.8)
                
            
            }.chartPlotStyle { plotArea in
                plotArea
                    .frame(width: 200, height: 200)
            }
            
            .frame(height: 200)
            
         
            
            VStack(alignment: .leading) {
                ForEach(sortedGenres, id: \.0) { genre in
                    HStack(spacing: 6) {
                        Rectangle()
                            .fill(colorForGenre(genre.0))
                            .frame(width: 10, height: 10)
                            .cornerRadius(2)
                        
                        Text(genre.0)
                            .font(.caption2)
                            .lineLimit(1)
                    }
                }
            }
            
            
        }
     
              
    }
        private func colorForGenre(_ genre: String) -> Color {
                let index = sortedGenres.firstIndex(where: { $0.0 == genre }) ?? 0
                
                if index == 0 {
                    return primaryColor
                } else {
                    let secondaryIndex = (index - 1) % secondaryColors.count
                    return secondaryColors[secondaryIndex]
                }
            }
            
            private func percentage(for count: Int) -> Int {
                guard totalBooks > 0 else { return 0 }
                return Int(round(Double(count) / Double(totalBooks) * 100))
            }
}

#Preview {
    GenreView(genres: [("Fantasy",10),("Romance",5),("Y&A",3),("Fiction",1)])
}
