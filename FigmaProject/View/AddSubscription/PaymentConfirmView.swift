import SwiftUI

struct PaymentConfirmView: View {
    @Environment(PaymentViewModel.self) var viewModel
    @State private var isOn = true
    @State private var iAgree = false
    @State private var showSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Покупка Premium подписки")
                .font(.gilroyPremium)
            SubscriptionCard()
            AutoLongCard()
            Text("Счёт списания")
                .font(.gilroyPremium)
            CardCell(card: viewModel.selectedCard ?? Card(number: 0000000000000000))
            Spacer()
            HStack {
                Image(systemName: iAgree ? "checkmark.square.fill" : "square")
                    .foregroundStyle(iAgree ? .redOrange : .lightGray)
                    .onTapGesture {
                        withAnimation { iAgree.toggle() }
                    }
                Text("Я согласен(-а) с условиями приобретения подписки")
                    .font(.gilroySubtitle)
            }
            if iAgree {
                Button {
                    showSheet.toggle()
                    UserDefaultsService.shared.setSub(sub: viewModel.subscription,
                                                      initDate: .now,
                                                      card: viewModel.selectedCard!,
                                                      autoRenew: viewModel.autoRenew)
                } label: {
                    CapsuleLink(text: "Подтвердить подписку", colors: [.buttonLeft, .buttonRight])
                }
            } else {
                CapsuleLink(text: "Подтвердить подписку", colors: [.inactiveOrangeBtn])
            }
        }
        .padding(.horizontal, 16 )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bgGray)
        .sheet(isPresented: $showSheet) {
            CongratulationView()
        }
    }
    
    @ViewBuilder func SubscriptionCard() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Название подписки").font(.gilroyLittleTitle)
                Text("Подписка будет активна до...").font(.gilroyText)
            }
            Spacer()
            Text("3400 ₽").font(.gilroyTargetBtn)
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    
    @ViewBuilder func AutoLongCard() -> some View {
        VStack(alignment: .leading, spacing: 0)  {
            HStack {
                Text("Автопродление")
                Spacer()
                Toggle("", isOn: $isOn)
                    .tint(.redOrange)
            }
            .font(.gilroyLittleTitle)
            if isOn {
                Text("Следующее списание \(viewModel.subscription.nextPayment)")
                    .padding(.top, 12)
                    .padding(.bottom, 4)
            }
            Text("Оплата за подписку будет автоматически списываться в указанную дату")
                .foregroundStyle(.lightGray)
        }.font(.gilroyText)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    
    @ViewBuilder func CardCell(card: Card) -> some View {
        HStack(spacing: 12) {
            Image(card.paySystem.imageName)
                .resizable()
                .frame(width: 30, height: 20)
            Text(card.secureNumber).font(.gilroyCell)
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.vertical, 20)
        .padding(.trailing, 16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    PaymentConfirmView()
}
