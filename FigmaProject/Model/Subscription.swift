import Foundation

enum Subscription: String, CaseIterable, Identifiable {
    case year
    case halfYear
    case threeMonths
    case month
    
    var id: String { rawValue }
    
    var hasGoodPrice: Bool {
        switch self {
        case .year: return true
        default: return false
        }
    }
    
    var hasPercent: Bool {
        switch self {
        case .threeMonths: return true
        default: return false
        }
    }
    
    var title: String {
        switch self {
        case .year: return "Год"
        case .halfYear: return "6 месяцев"
        case .threeMonths: return "3 месяца"
        case .month: return "1 месяц"
        }
    }
    
    var text: String {
        switch self {
        case .year: return "Отсчёт начнётся с даты покупки"
        case .halfYear: return "3 998 руб/год"
        case .threeMonths: return "5 196 руб/год"
        case .month: return "8 388 руб/год"
        }
    }
    
    var price: Int {
        switch self {
        case .year: return 2699
        case .halfYear: return 1999
        case .threeMonths: return 1299
        case .month: return 699
        }
    }
    
    var nextPayment: String {
        let calendar = Calendar.current
        
        switch self {
        case .year:
            if let future = calendar.date(byAdding: .year,
                                          value: 1,
                                          to: .now) {
                return future.formatted(date: .numeric,
                                        time: .omitted)
            } else { return Date.now.formatted(date: .numeric,
                                               time: .omitted) }
        case .halfYear:
            if let future = calendar.date(byAdding: .month, value: 6, to: .now) {
                return future.formatted(date: .numeric, time: .omitted)
            } else { return Date.now.formatted(date: .numeric, time: .omitted) }
        case .threeMonths:
            if let future = calendar.date(byAdding: .month, value: 3, to: .now) {
                return future.formatted(date: .numeric, time: .omitted)
            } else { return Date.now.formatted(date: .numeric, time: .omitted) }
        case .month:
            if let future = calendar.date(byAdding: .month, value: 1, to: .now) {
                return future.formatted(date: .numeric, time: .omitted)
            } else { return Date.now.formatted(date: .numeric, time: .omitted) }
        }
    }
}
