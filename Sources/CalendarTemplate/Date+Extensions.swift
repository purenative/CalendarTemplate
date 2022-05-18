import Foundation

extension Date {
    
    private static let daySeconds: TimeInterval = 86_400
    
    var weekday: Int {
        let needShift = Calendar.current.firstWeekday == 2
        var weekday = Calendar.current.component(.weekday, from: self)
        
        if needShift {
            weekday = weekday == 1 ? 7 : weekday - 1
        }
        
        return weekday
    }
    
    func dayStart() -> Date {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: dateComponents)
        return date ?? self
    }
    
    func weekDates() -> [Date] {
        var dates = [Date]()
        
        let startShift = TimeInterval(weekday - 1) * Self.daySeconds
        let startDate = self.addingTimeInterval(-startShift)
        
        for index in 0..<7 {
            let nextDate = startDate.addingTimeInterval(TimeInterval(index) * Self.daySeconds)
            dates.append(nextDate)
        }
        
        return dates
    }
    
    func monthDates() -> [Date] {
        var dates = [Date]()
        
        var dateComponents = Calendar.current.dateComponents([.year, .month], from: self)
        dateComponents.setValue(1, for: .day)
        
        guard let startDate = Calendar.current.date(from: dateComponents) else {
            return []
        }
        
        let daysInMonth = Calendar.current.range(of: .day, in: .month, for: self)?.upperBound ?? 30
        
        for index in 0..<(daysInMonth - 1) {
            let nextDate = startDate.addingTimeInterval(TimeInterval(index) * Self.daySeconds)
            dates.append(nextDate)
        }
        
        return dates
    }
    
    func nextMonthDate() -> Date {
        Calendar.current.date(byAdding: .month, value: 1, to: self) ?? self
    }
    
}

extension Date: Identifiable {
    
    public var id: TimeInterval {
        timeIntervalSince1970
    }
    
}
