import SwiftUI

struct InfoCarouselView: View {
    @State var viewModel = CarouselViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(viewModel.items) { item in
                        VStack(spacing: 16) {
                            Image(item.imageName)
                                .frame(height: 160)
                                .frame(maxWidth: .infinity)
                                .background {
                                    ZStack {
                                        Ellipse()
                                            .fill(RadialGradient(colors: [Color(item.colorName), Color(item.colorName).opacity(0)], center: .center, startRadius: 0, endRadius: 165))
                                            .frame(width: 331, height: 329)
                                            .blur(radius: 30)
                                            .opacity(0.4)
                                            
                                        Image(.bigStarsDots)
                                    }
                                }
                                .padding(186)
                            Text(item.title)
                                .font(.gilroyTitle)
                            Text(item.subtitle)
                                .font(.gilroySubtitle)
                                .multilineTextAlignment(.center)
                                .frame(width: 320, height: 60)
                                .padding(.bottom, 40)
                        }
                        .frame(width: UIScreen.main.bounds.width - 42)
                    }
                    .foregroundStyle(.white)
                    .padding(22)
                    .preferredColorScheme(.dark)
                    }
                .overlay(alignment: .bottom) {
                        DotsView(activeTint: .lightCardBG,
                                 inactiveTint: .capsule20)
                }
        }
        
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    InfoCarouselView()
}
