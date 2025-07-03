import SwiftUI

struct SubscriptionCardView: View {
    
    @State private var showPreferencesSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(.logoEpisode)
                    .frame(width: 89, height: 24)
                Spacer()
                NavigationLink {
                    InfoView()
                } label: {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .opacity(0.5)
                }
            }
            Text("Premium")
                .font(.gilroyLargeTitle)
            Spacer()
            if SharedStorage.shared.settings.autoRenew {
                switch SharedStorage.shared.settings.subState {
                case .unsubscripted: Text("")
                case .subscripted(let sub):
                    Text("\(sub.price) ₽ спишется \(sub.nextPayment)")
                        .font(.gilroySubtitle)
                }
                
            } else {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .font(.gilroySubtitle)
                    Text("Автопродление отключено")
                        .font(.gilroySubtitle)
                }
            }
            HStack {
                NavigationLink {
                    PaymentMethodView(viewModel: .init(subscription: .year),
                                      place: .mainScreen)
                } label: {
                    HStack(spacing: 12) {
                        Image(SharedStorage.shared.settings.card.paySystem.imageName)
                            .resizable()
                            .frame(width: 30, height: 20)
                        Text("\(String(SharedStorage.shared.settings.card.number).dropFirst(12))")
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }

                Button {
                    showPreferencesSheet = true
                } label: {
                    Text("Настроить")
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
            }
            .font(.gilroyLittleTitle)
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 24)
        .padding(.top, 16)
        .padding(.bottom, 14)
        .background(.cardBG)
        .frame(height: 215)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .sheet(isPresented: $showPreferencesSheet) {
            PreferrencesView()
                .presentationDetents([.medium])
        }
        
    }
}

#Preview {
    NavigationStack {
        SubscriptionCardView()
    }
}
