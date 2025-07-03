import Foundation

class UserDefaultsService {
    static let shared = UserDefaultsService(); private init() { }
    private let ud = UserDefaults.standard
    private let subKey = "subscription"
    private let initDateKey = "initDate"
    private let cardNumberKey = "cardNumber"
    private let autoRenewKey = "autoRenew"
    
    func setSub(sub: Subscription,
                initDate: Date,
                card: Card,
                autoRenew: Bool) {
        ud.set(sub.rawValue, forKey: subKey)
        ud.set(initDate, forKey: initDateKey)
        setCard(card)
        ud.set(autoRenew, forKey: autoRenewKey)
    }
    
    func setCard(_ card: Card) {
        ud.set(card.number, forKey: cardNumberKey)
    }
    
    func getSettings() -> SubscriptionSettings? {
        guard let subValue = ud.string(forKey: subKey),
              let initDate = ud.value(forKey: initDateKey) as? Date,
              let cardNumber = ud.value(forKey: cardNumberKey) as? Int,
              let autoRenew = ud.value(forKey: autoRenewKey) as? Bool else { return nil }
        
        guard let sub = Subscription(rawValue: subValue) else { return nil }
        
        let settings = SubscriptionSettings(subscription: sub,
                                            initDate: initDate,
                                            autoRenew: autoRenew,
                                            cardNumber: cardNumber)
        return settings
    }
    
    func removeSubscription() {
        ud.removeObject(forKey: subKey)
    }
    
}


