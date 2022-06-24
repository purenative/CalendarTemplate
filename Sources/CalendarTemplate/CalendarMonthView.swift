import SwiftUI

public struct CalendarMonthView<MonthDayView: View>: View {
    
    public var spacing: CGFloat = 16
    public let date: Date
    public let monthDayView: (Date) -> MonthDayView
    
    public init(date: Date,
                monthDayView: @escaping (Date) -> MonthDayView) {
        
        self.date = date
        self.monthDayView = monthDayView
    }
    
    public var body: some View {
        let gridItem = GridItem(.flexible())
        let columns = Array(repeating: gridItem,
                            count: 7)
        
        LazyVGrid(columns: columns, spacing: spacing) {
            let dates = date.monthDates()
            
            ForEach(0..<((dates.first?.weekday ?? 1) - 1)) { _ in
                Color.clear
            }
            
            ForEach(dates) { date in
                monthDayView(date)
            }
        }
    }
    
}
