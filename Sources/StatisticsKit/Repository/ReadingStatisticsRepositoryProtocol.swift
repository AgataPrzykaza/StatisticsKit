//
//  ReadingStatisticsRepositoryProtocol.swift
//  StatisticsKit
//
//  Created by Agata Przykaza on 13/06/2025.
//
import Foundation

public protocol StatisticsRepositoryProtocol {
    func getBooksReadThisYear() async throws -> Int
    func getCurrentReadingStreak() async throws -> Int
    func getFavoriteAuthors(limit: Int) async throws -> [(String, Int)]
    
    func getReadingDaysInMonth(_ month: Date) async throws -> Int
    func getBooksReadInMonth(_ month: Date) async throws -> Int
    func getMonthlyCalendarData(for month: Date) async throws -> [Date: [ReadingBookInfo]]
    
    func getReadingDaysThisMonth() async throws -> Int
    func getBooksReadThisMonth() async throws -> Int
}
