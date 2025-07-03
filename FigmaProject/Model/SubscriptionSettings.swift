import Foundation

struct SubscriptionSettings {
    var subState: SubState
    var initDate: Date
    var autoRenew: Bool
    var card: Card
    
    init(subscription: Subscription?,
         initDate: Date,
         autoRenew: Bool,
         cardNumber: Int) {
        if let subscription {
            subState = .subscripted(sub: subscription)
        } else { subState = .unsubscripted }
        self.initDate = initDate
        self.autoRenew = autoRenew
        self.card = Card(number: cardNumber)
    }
}

