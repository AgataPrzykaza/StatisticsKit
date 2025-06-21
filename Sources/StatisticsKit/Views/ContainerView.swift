//
//  SwiftUIView.swift
//  StatisticsKit
//
//  Created by Agata Przykaza on 13/06/2025.
//
import SwiftUI
import Charts

struct ContainerView<Content: View>: View {
    let subtitle: String
    let title: String
    let content: Content
    
    init(title: String,subtitle: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
               
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(title)
                    .font(.title)
                    .foregroundStyle(ChartConstants.Colors.bluePink)
                    .fontWeight(.heavy)
            
           
            
            content
        }
        
        .frame(minWidth: 350)
        .padding(10)
        .background(.white)
        .cornerRadius(8)
        
    }
}

#Preview("Authors") {
    ScrollView{
        VStack{
            ContainerView(title: "Autorzy", subtitle: "Najpopularniejsi") {
                AuthorsView(favoriteAuthors: [
                    ("Andrzej Sapkowski", 8),
                    ("George Orwell", 5),
                    ("Frank Herbert", 4),
                    ("Isaac Asimov", 6),
                    ("Terry Pratchett", 3)
                ])
                .frame(height: 250)
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
    

}

#Preview("Rating"){
    ScrollView{
        VStack{
            ContainerView(title: "4.5", subtitle: "Średnia ocena") {
                RatingView(ratings: [
                                    (5, 15),
                                    (4, 25),
                                    (3, 8),
                                    (2, 3),
                                    (1, 0)
                                ])
                .frame(height: 250)
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
}

#Preview("Genre"){
    
    ScrollView{
        VStack{
            ContainerView(title: "4.5", subtitle: "Średnia ocena") {
                GenreView(genres: [("Fantasy",10),("Romance",5),("Y&A",3),("Fiction",1)])
                .frame(height: 250)
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
    
}
