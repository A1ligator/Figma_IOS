import SwiftUI

struct PreferrencesView: View {
    @State private var autoRenew: Bool
    @Environment(\.dismiss) var dismiss
    
    init() {
        self.autoRenew = SharedStorage.shared.settings.autoRenew
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("Настроить").font(.gilroyTitle)
                VStack(alignment: .leading, spacing: 4) {
                    Toggle("Автопродление", isOn: $autoRenew)
                        .font(.gilroyBoldCell)
                        .tint(.redOrange)
                        .padding(.horizontal)
                        .padding(.vertical, 17)
                        .background {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.white)
                        }
                    Text("Оплата за подписку будет автоматически списываться в указанную дату")
                        .foregroundStyle(.grayText)
                        .font(.gilroyText)
                    if autoRenew == false {
                        NavigationLink("Сохранить") {
                            SelectReasonView()
                        }
                        .font(.gilroyBoldBtn)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 28)
                    } else {
                        Button("Сохранить", action: {
                            dismiss()
                        })
                            .font(.gilroyBoldBtn)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 28)
                    }
                }
                Spacer()
            }
            .padding(.top, 36)
            .padding(.horizontal)
            .background(.bgGray)
            .onDisappear {
                SharedStorage.shared.refreshData()
            }
        }
    }
}

#Preview {
    PreferrencesView()
}
