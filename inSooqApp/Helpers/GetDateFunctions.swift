//
//  GetDateFunctions.swift
//  ACIsamsung
//
//  Created by mohammad ahmad on 1/17/21.
//

import Foundation
import UIKit


extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }

}

//
//func getDays(dateMonth:Date)->[String]{
//    var storeDate = [String]()
//    var date =  dateMonth.startOfMonth()
//    let endDate =   dateMonth.endOfMonth() // last date
//    
//    debugPrint("dateDay:",date)
//    debugPrint("endDay:",endDate)
//    
//    // Formatter for printing the date, adjust it according to your needs:
//    let fmt = DateFormatter()
//    fmt.dateFormat = "dd"
//    
//    while date <= endDate {
//        let dateString = fmt.string(from: date)
//        debugPrint("dateString:",dateString)
//        date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
//        storeDate.append(dateString)
//    }
//    return storeDate
//}

func getDaysForMonth(from start: String, to end: String) -> [String] {
    let format = DateFormatter()
    format.dateFormat = "dd/MM/yyyy"

    guard let startDate = format.date(from: start),
        let endDate = format.date(from: end) else {
            return []
    }

    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents(Set([.day]), from: startDate, to: endDate)

    var allDates: [String] = []
    let dateRangeFormatter = DateFormatter()
    dateRangeFormatter.dateFormat = "dd"

    for i in 0 ... components.day!-1{
        guard let date = calendar.date(byAdding: .day, value: i, to: startDate) else {
        continue
        }

        let formattedDate = dateRangeFormatter.string(from: date)
        allDates += [formattedDate]
    }
    return allDates
}
func getYearBetween(from start: String, to end: String) -> [String] {
    let format = DateFormatter()
    format.dateFormat = "dd/MM/yyyy"

    guard let startDate = format.date(from: start),
        let endDate = format.date(from: end) else {
            return []
    }

    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents(Set([.year]), from: startDate, to: endDate)

    var allDates: [String] = []
    let dateRangeFormatter = DateFormatter()
    dateRangeFormatter.dateFormat = "yyyy"

    for i in 0 ... components.year!{
        guard let date = calendar.date(byAdding: .year, value: i, to: startDate) else {
        continue
        }

        let formattedDate = dateRangeFormatter.string(from: date)
        allDates += [formattedDate]
    }
    return allDates.reversed()
}

func getMonthesForYear(from start: String, to end: String) -> [String] {
    let format = DateFormatter()
    format.dateFormat = "dd/MM/yyyy"

    guard let startDate = format.date(from: start),
        let endDate = format.date(from: end) else {
            return []
    }

    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents(Set([.month]), from: startDate, to: endDate)

    var allDates: [String] = []
    let dateRangeFormatter = DateFormatter()
    dateRangeFormatter.dateFormat = "MMMM"

    for i in 0 ... components.month! {
        guard let date = calendar.date(byAdding: .month, value: i, to: startDate) else {
        continue
        }

        let formattedDate = dateRangeFormatter.string(from: date)
        allDates += [formattedDate]
    }
    return allDates
}
