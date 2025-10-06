//
//  SwiftUIView.swift
//  Habbits
//
//  Created by Ji y LEE on 5/12/25.

import Foundation


extension Calendar {
    /// 주어진 시각이 속한 "가장 최근 4 PM 경계"를 돌려줍니다.
    func last4PMBoundary(for date: Date) -> Date {
        // 날짜(연·월·일)만 뽑고 시각을 16:00:00으로 고정
        var c = dateComponents([.year, .month, .day], from: date)
        c.hour   = 23
        c.minute = 59
        c.second = 0

        // 그 날 16:00이 아직 오지 않았다면, 전날 16:00으로 한 칸 뒤로
        let today4PM = self.date(from: c)!
        return date >= today4PM ? today4PM
                                : self.date(byAdding: .day, value: -1, to: today4PM)!
    }
}


struct Habbit: Identifiable, Codable, Equatable, Hashable {
    var id: UUID
    
    
    var name: String
    var countOfDay: Int
    var lastUpdatedDate: Date?
    var startDate:Date
    var didIt: [Int]
    var emoji: String
    var color: String        // Color 대신 hex string
    var showCount: Bool
    var showStreak: Bool
    
  
    
    mutating func addDidIt() {
        if let index = didIt.firstIndex(of: countOfDay) {
            // 이미 들어있으면 제거
            didIt.remove(at: index)
        } else {
            // 없으면 추가
            didIt.append(countOfDay)
        }
    }
    
 
    
    mutating func updateCountIfNeeded() {
        let calendar = Calendar.current
        let now = Date()
        
        let from = calendar.last4PMBoundary(for: startDate)
        let to   = calendar.last4PMBoundary(for: now)
        
        let daysPassed = calendar.dateComponents([.day], from: from, to: to).day ?? 0
        
        // 경계를 넘었으면 최소 1부터 시작 (startDate == now 일 경우도 포함)
        countOfDay = max(1, daysPassed + 1)
        lastUpdatedDate = now
    }
    
}
