import SwiftUI

public struct CalendarWeekView<WeekDayView: View>: View {
    
    public let minSpacing: CGFloat
    public let date: Date
    public let weekdayView: (Date) -> WeekDayView
    
    public init(minSpacing: CGFloat = .zero,
                date: Date,
                weekdayView: @escaping (Date) -> WeekDayView) {
        
        self.minSpacing = minSpacing
        self.date = date
        self.weekdayView = weekdayView
    }
    
    public var body: some View {
        HStack(spacing: .zero) {
            let dates = date.weekDates()
            
            ForEach(dates) { date in
                weekdayView(date)
                
                if date != dates.last {
                    Spacer(minLength: minSpacing)
                }
            }
        }
    }
    
}
