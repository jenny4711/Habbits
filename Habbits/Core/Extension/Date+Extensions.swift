//
//  Date+Extensions.swift
//  Habbits
//
//  Created by Ji y LEE on 5/19/25.
//

import Foundation

extension Date {
    var formattedDay:String{
        let now = Date()
        let calendar = Calendar.current
        
        let nowStartOfDay = calendar.startOfDay(for: now)
        let dateStartOfDay = calendar.startOfDay(for: self)
        let numOfDaysDifference = calendar.dateComponents([.day], from: nowStartOfDay,to: dateStartOfDay).day!
        
        if  numOfDaysDifference == 0 {
            return "Today"
        }else{
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "M/d "
            return formatter.string(from:self)
             
        }

    }
  
}
