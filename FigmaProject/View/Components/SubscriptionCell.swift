import SwiftUI

struct SubscriptionCell: View {
    var subscription: Subscription
    var bgColor: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 8) {
                    Text(subscription.title)
                        .font(.gilroySubtitle.bold())
                        .overlay(alignment: .leading) {
                            if subscription.hasPercent {
                                Text("-33%")
                                    .font(.gilroySubtitle.bold())
                                    .frame(width: 59, height: 24)
                                    .background(Color.capcule)
                                    .clipShape(.capsule)
                                    .background {
                                        Capsule()
                                            .stroke(lineWidth: 1.6)
                                    }
                                    .offset(x: 86)
                            }
                        }
                }
                Text(subscription.text)
                    .font(.gilroyText)
            }
            Spacer()
            Text("\(subscription.price) ₽")
                .font(.gilroyTitle)
        }
        .padding(.leading, 20)
        .padding(.trailing, 27)
        .padding(.vertical, 16)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(alignment: .topTrailing) {
            if subscription.hasGoodPrice {
                Text("выгодно")
                    .font(.gilroySubtitle.bold())
                    .frame(width: 83, height: 24)
                    .background(Capsule().fill(.white).opacity(0.2))
                    .background {
                        Capsule()
                            .fill(.ultraThinMaterial)
                    }
                    .clipShape(.capsule)
                    .background {
                        Capsule()
                            .stroke(lineWidth: 1.6)
                    }
                    .offset(y: -8)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    SubscriptionCell(subscription: .year, bgColor: .white.opacity(0.1))
}
