//
//  ReadingStatistics.swift
//  StatisticsKit
//
//  Created by Agata Przykaza on 13/06/2025.
//
import Foundation

public struct ReadingStatistics {
    public let currentStreak: Int
    public let booksReadThisYear: Int
    public let yearlyGoal: Int
    public let favoriteAuthors: [(String, Int)]
   
   
    public let readingDaysThisMonth: Int
    public let totalDaysInMonth: Int
    public let booksReadThisMonth: Int
    public let monthlyCalendarData: [Date: [ReadingBookInfo]]
    
    public var goalProgress: Double {
        return yearlyGoal > 0 ? Double(booksReadThisYear) / Double(yearlyGoal) : 0
    }
    
    
    public var monthlyReadingConsistency: Double {
        return totalDaysInMonth > 0 ? Double(readingDaysThisMonth) / Double(totalDaysInMonth) : 0
    }
    
    public var averageBooksPerMonth: Double {
        let currentMonth = Calendar.current.component(.month, from: Date())
        return currentMonth > 0 ? Double(booksReadThisYear) / Double(currentMonth) : 0
    }
    
    public init(
        currentStreak: Int,
        booksReadThisYear: Int,
        yearlyGoal: Int,
        favoriteAuthors: [(String, Int)],
        readingDaysThisMonth: Int,
        totalDaysInMonth: Int,
        booksReadThisMonth: Int,
        monthlyCalendarData: [Date: [ReadingBookInfo]]
    ) {
        self.currentStreak = currentStreak
        self.booksReadThisYear = booksReadThisYear
        self.yearlyGoal = yearlyGoal
        self.favoriteAuthors = favoriteAuthors
        self.readingDaysThisMonth = readingDaysThisMonth
        self.totalDaysInMonth = totalDaysInMonth
        self.booksReadThisMonth = booksReadThisMonth
        self.monthlyCalendarData = monthlyCalendarData
    }
}

public struct ReadingBookInfo: Identifiable {
    public let id = UUID()
    public let title: String
    public let author: String
    public let status: String
    public let thumbnailURL: String?
    
    public init(title: String, author: String, status: String, thumbnailURL: String? = nil) {
            self.title = title
            self.author = author
            self.status = status
            self.thumbnailURL = thumbnailURL
        }
}
