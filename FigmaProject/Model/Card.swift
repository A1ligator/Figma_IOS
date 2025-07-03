import SwiftData

@Model
class Card: Identifiable {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    var paySystem: PaySystem {
        switch String(number).first {
        case "1": return .mir
        case "4": return .visa
        case "5": return .master
        default: return .another
        }
    }
    
    var secureNumber: String {
        let numStr = String(number)
        let first = String(numStr.dropLast(12))
        let last = String(numStr.dropFirst(12))
        let result = "\(first) ···· ···· \(last)"
        return result
    }
    
    static var mockCards: [Card] = [
        .init(number: 1234567812345678),
        .init(number: 4567890987654321),
        .init(number: 5678908765432121),
        .init(number: 7890678985674836),
        .init(number: 4563746584759485)
    ]
}

enum PaySystem: String {
    case mir = "Мир"
    case master = "MasterCard"
    case visa = "Visa"
    case another = "Другое"
    
    var imageName: String {
        switch self {
        case .mir: "mir"
        case .master: "mc"
        case .visa: "visa"
        case .another: "another"
        }
    }
}
