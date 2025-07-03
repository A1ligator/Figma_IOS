import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack(spacing: 56) {
            InfoCarouselView()
            Spacer()
            Button("Отлично") { }
                .font(.gilroyTargetBtn)
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(.lightCardBG)
                .clipShape(.capsule)
                .padding(.bottom, 40)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(.container)
    }
}

#Preview {
    InfoView()
}
