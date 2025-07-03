import SwiftUI

struct NotifyView: View {
    let notify: Notify
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .foregroundStyle(.green)
                .frame(width: 28, height: 28)
            Text(notify.rawValue)
                .font(.gilroySubtitle)
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 13)
        .background {
            RoundedRectangle(cornerRadius: 18)
            .fill(.black.opacity(0.25))
        }
        
        .padding()
    }
}

enum Notify: String {
    case cardChanged = "Способ оплаты изменён"
    case autoRenewOff = "Автообновление отключено"
    case autoRenewOn = "Автообновление включено"

}

#Preview {
    NotifyView(notify: .autoRenewOff)
}
