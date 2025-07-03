import SwiftUI

struct SubscriptionView: View {
    @State private var selectedSubscription: Subscription = .year
    
    var body: some View {
        VStack(spacing: 16) {
            CarouselView()
                .frame(width: UIScreen.main.bounds.width)
            ForEach(Subscription.allCases) { sub in
                SubscriptionCell(subscription: sub,
                                 bgColor: selectedSubscription.id == sub.id ? .lightCardBG : .white.opacity(0.1) )
                .onTapGesture {
                    withAnimation {
                        selectedSubscription = sub
                    }
                }
            }
            
            NavigationLink {
                PaymentMethodView(viewModel: PaymentViewModel(subscription: selectedSubscription), place: .addSubscription)
                    .colorScheme(.light)
            } label: {
                Text("Подключить за \(selectedSubscription.price) р/мес")
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(.lightCardBG)
                .clipShape(.capsule)
                .padding(.top, 16)
                .foregroundStyle(.white)
                .font(.gilroyTargetBtn)
            }
            
            
        }
            .padding(.horizontal, 16)
            .background(.black)
            .frame(width: UIScreen.main.bounds.width - 5)
    }
}

#Preview {
    NavigationStack {
        SubscriptionView()
    }
}
