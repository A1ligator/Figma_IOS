import SwiftUI

struct CapsuleLink: View {
    var text: String
    var colors: [Color]
    
    var body: some View {

            Text(text)
                .frame(height: 54)
                .frame(maxWidth: .infinity)
                .background {
                    if colors.count > 1 {
                        LinearGradient(colors: [colors[0], colors[1]], startPoint: .leading, endPoint: .trailing)
                    } else {
                        Color(colors[0])
                    }
                }
                .foregroundStyle(.white)
                .font(.gilroyTargetBtn)
                .clipShape(.capsule)
    }
}

#Preview {
    CapsuleLink(text: "Оплатить", colors: [.buttonLeft, .buttonRight])
}
