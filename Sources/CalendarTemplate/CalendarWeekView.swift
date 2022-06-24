import SwiftUI

public struct CalendarWeekView<WeekDayView: View>: View {
    
    public let spacing: CGFloat
    public let date: Date
    public let weekdayView: (Date) -> WeekDayView
    
    public init(spacing: CGFloat = .zero,
                date: Date,
                weekdayView: @escaping (Date) -> WeekDayView) {
        
        self.spacing = spacing
        self.date = date
        self.weekdayView = weekdayView
    }
    
    public var body: some View {
        HStack(spacing: .zero) {
            let dates = date.weekDates()
            
            ForEach(dates) { date in
                weekdayView(date)
                
                if spacing > .zero && date != dates.last {
                    Spacer(minLength: spacing)
                }
            }
        }
    }
    
}
