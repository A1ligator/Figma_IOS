import SwiftUI

struct PremiumCardView: View {
    var body: some View {
        HStack(spacing: 24) {
            ZStack {
                Circle()
                    .fill(.circlePurple)
                    .blur(radius: 40)
                    .frame(width: 80, height: 80)
                    .offset(x: -50, y: 45)
                Image(.rocket)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(12)
                    .background(.rocketBG)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(1.3)
                    .background {
                        LinearGradient(colors: [.strokeRocket.opacity(0.1), .strokeRocket.opacity(0.03)],
                                       startPoint: .leading,
                                       endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
            }
            VStack(alignment: .leading, spacing: 0) {
                Text("Premuim")
                    .font(.gilroyTitle)
                Text("Подключите episode premium, чтобы открыть доступ ко всем функциям приложения")
                    .multilineTextAlignment(.leading)
                    .font(.gilroyText)
                    .opacity(0.8)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 19)
        .frame(maxWidth: .infinity, maxHeight: 102)
        .background(.cardBG)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .foregroundStyle(.white)

        
    }
}

#Preview {
    PremiumCardView()
}
