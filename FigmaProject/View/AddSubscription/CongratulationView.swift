import SwiftUI

struct CongratulationView: View {
    @Environment(PaymentViewModel.self) var viewModel
    
    var body: some View {
        VStack {
            ZStack {
                Image(.stars)
                Image(.final)
            }
            VStack(spacing: 16) {
                Text("Вы - премиум пользователь")
                    .font(.gilroyBoldCell.bold())
                Text("Поздравляем! Вы подключили premium подписку. Теперь Вам доступны особые функции приложения")
                    .font(.gilroySubtitle)
                    .padding(.bottom, 16)
                Button {
                    SharedStorage.shared.settings.subState = .subscripted(sub: viewModel.subscription)
                    SharedStorage.shared.settings.autoRenew = viewModel.autoRenew
                    SharedStorage.shared.showOn = true
                } label: {
                    CapsuleLink(text: "Отлично", colors: [.lightCardBG])
                }
            }.padding(.horizontal, 22)
                .foregroundStyle(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    CongratulationView()
}
