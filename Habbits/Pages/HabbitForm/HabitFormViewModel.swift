//
//  HabitFormViewModel.swift
//  Habbits
//
//  Created by Ji y LEE on 5/12/25.
//

import Foundation
import SwiftUI
class HabitFormViewModel:ObservableObject{
    @Published var id:UUID
    @Published var name: String
    @Published var emoji: String
    @Published var color: String
    @Published var showCount: Bool
    @Published var showStreak: Bool
    @Published var countOfDay: Int
    @Published var didIt: [Int]
    @Published var tempColor:Color
    @Published var startDate:Date
    
    init(
    id:UUID = UUID(),
        name: String = "",
        emoji: String = "",
        color:String = "",
        showCount: Bool = false,
        showStreak: Bool = false,
        countOfDay: Int = 1,
        didIt: [Int] = [],
        tempColor: Color = .blue,
        startDate: Date = .now
    ) {
        self.name = name
        self.emoji = emoji
        self.color = color
        self.showCount = showCount
        self.showStreak = showStreak
        self.countOfDay = countOfDay
        self.didIt = didIt
        self.tempColor = tempColor
        self.id = id
        self.startDate = startDate
    }
    
}
extension HabitFormViewModel{
    func fixedHex() -> String {
        return tempColor.toHex() ?? "#0000FF"
    }
    
    
    func toHabbit() -> Habbit {
            return Habbit(
                id:UUID(),
                name: self.name,
                countOfDay: self.countOfDay,
                lastUpdatedDate: nil,// 필요시 self.lastUpdatedDate 추가
                startDate:self.startDate,
                didIt: self.didIt,
                emoji: self.emoji,
                color: self.fixedHex(),
                showCount: self.showCount,
                showStreak: self.showStreak
            )
        }
    
    
    
}
