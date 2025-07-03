import Foundation

@Observable
class SharedStorage {
    static let shared = SharedStorage()
    var settings: SubscriptionSettings
    var showOff = false
    var showOn = false
    var showChangeCard = false
    
    private init() {
        if let settings = UserDefaultsService.shared.getSettings() {
            self.settings = settings
        } else {
            self.settings = SubscriptionSettings(subscription: .none,
                                                 initDate: .now,
                                                 autoRenew: true,
                                                 cardNumber: 0000_0000_0000_0000)
        }
    }
    
    func refreshData() {
        if let settings = UserDefaultsService.shared.getSettings() {
            self.settings = settings
        } else {
            self.settings = SubscriptionSettings(subscription: .none,
                                                 initDate: .now,
                                                 autoRenew: true,
                                                 cardNumber: 0000_0000_0000_0000)
        }
    }
    

}

enum SubState {
    case unsubscripted
    case subscripted(sub: Subscription)
}
