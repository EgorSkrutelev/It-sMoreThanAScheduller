//
//  CalendarMonthView.swift
//  CalendarList
//
//  Created by Jorge Villalobos Beato on 3/11/20.
//  Copyright © 2020 CalendarList. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct CalendarMonthView<T:Hashable>: View {
    let month:CalendarMonth
    let calendar:Calendar
    @Binding var selectedDate:Date
    let calendarDayHeight:CGFloat
    let eventsForDate: [Date: [CalendarEvent<T>] ]
    let selectedDateColor:Color
    let todayDateColor:Color
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ForEach(self.month.weeks, id:\.self) { week in
                    HStack(spacing: 0) {
                        ForEach(getRangeForMarginsTop(week: week), id:\.self) { num in
                            Text("")
                                .frame(
                                    width: self.dayViewWidth(parentWidth: geometry.size.width),
                                    height: self.calendarDayHeight
                                )
                        }
                        
                        ForEach(week, id:\.self) { day in
                            CalendarViewDay(
                                calendar: self.calendar,
                                day: day,
                                selected: CalendarUtils.isSameDay(
                                    date1: self.selectedDate,
                                    date2: day,
                                    calendar: self.calendar
                                ),
                                hasEvents: self.dayHasEvents(day),
                                width: self.dayViewWidth(parentWidth: geometry.size.width),
                                height: self.calendarDayHeight,
                                selectedDateColor: self.selectedDateColor,
                                todayDateColor: self.todayDateColor
                            )
                            .onTapGesture {
                                self.selectedDate = day
                            }
                        }
                        
                        ForEach(getRangeForMarginsBottom(week: week), id:\.self) { num in
                            Text("")
                                .frame(
                                    width: self.dayViewWidth(parentWidth: geometry.size.width),
                                    height: self.calendarDayHeight
                                )
                        }
                    }
                    .padding([.leading, .trailing], 10)
                }
            }
        }
    }
    
    func getRangeForMarginsTop(week: [Date]) -> Range<Int> {
        if week.count < 7 && self.containsFirstDayOfMonth(week) {
            let diff = 7 - week.count
            return 1..<diff+1
        }
        return 0..<0
    }
    
    func getRangeForMarginsBottom(week: [Date]) -> Range<Int> {
        if week.count < 7 && !self.containsFirstDayOfMonth(week) {
            let diff = 7 - week.count
            return 1..<diff+1
        }
        return 0..<0
    }
        
    func dayViewWidth(parentWidth:CGFloat) -> CGFloat {
        return (parentWidth - 20) / 7
    }
    
    func containsFirstDayOfMonth(_ dates:[Date]) -> Bool {
        return dates.contains { (date) -> Bool in
            calendar.component(.day, from: date) == 1
        }
    }
    
    func dayHasEvents(_ date:Date) -> Bool {
        let actualDay = CalendarUtils.resetHourPart(of: date, calendar:self.calendar)
        
        if let events = self.eventsForDate[actualDay] {
            return events.count > 0
        } else {
            return false
        }
    }
}
