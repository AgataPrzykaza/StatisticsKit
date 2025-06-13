//
//  SwiftUIView.swift
//  StatisticsKit
//
//  Created by Agata Przykaza on 13/06/2025.
//
import SwiftUI
import Charts

struct ContainerView<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
               
                Text("Najpopularniejsi")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(title)
                    .font(.title)
                    .foregroundStyle(ChartConstants.Colors.bluePink)
                    .fontWeight(.heavy)
            
           
            
            content
        }
        .padding(10)
        .background(.white)
        .cornerRadius(8)
    }
}

#Preview {
    ScrollView{
        VStack{
            ContainerView(title: "Autorzy") {
                Chart([("Sapkowski", 8), ("Orwell", 5), ("Herbert", 4)], id: \.0) { author in
                    BarMark(
                        x: .value("Książki", author.1),
                        y: .value("Autor", author.0)
                    )
                    .foregroundStyle(.blue)
                }
                .frame(height: 150)
                .chartXAxis(.hidden)
                .chartYAxis {
                    AxisMarks(position: .leading) { _ in
                        AxisValueLabel()
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
    

}
