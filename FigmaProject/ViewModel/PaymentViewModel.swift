import Foundation

@Observable
class PaymentViewModel {
//    var dataService: SwiftDataService
    var subscription: Subscription
    var selectedCard: Card?
    var cards: [Card] = []
    var autoRenew: Bool = true
    var isAgree: Bool = false
    
    init(subscription: Subscription, /*dataService: SwiftDataService*/) {
        self.subscription = subscription
//        self.dataService = dataService
        fetchData()
    }
    
    func fetchData() {
        self.cards = Card.mockCards
        self.selectedCard = cards[0]
    }
}

