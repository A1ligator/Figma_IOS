import SwiftUI

struct DotsView: View {
    var activeTint: Color = .lightCardBG
    var inactiveTint: Color = .capsule20
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            if let scrollViewWidth = geometry.bounds(of: .scrollView(axis: .horizontal))?.width,
               scrollViewWidth > 0 {
                
                let minX = geometry.frame(in: .scrollView(axis: .horizontal)).minX
                let freeProgress = -minX / scrollViewWidth
                let totalPages = Int(width / scrollViewWidth)
                let clampedProgress = min(max(freeProgress, 0), CGFloat(totalPages - 1))
                
                let activeIndex = min(Int(clampedProgress), totalPages - 1)
                let nextIndex = min(Int(clampedProgress.rounded(.awayFromZero)), totalPages - 1)
                let indicatorProgress = clampedProgress - CGFloat(activeIndex)
                
                let currentPageWidth = 18 - (indicatorProgress * 18)
                let nextPageWidth = indicatorProgress * 18
                
                HStack(spacing: 10) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Capsule()
                            .fill(.clear)
                            .frame(
                                width: 8 + (activeIndex == index ? currentPageWidth :
                                           nextIndex == index ? nextPageWidth : 0),
                                height: 8
                            )
                            .overlay {
                                ZStack {
                                    Capsule()
                                        .fill(inactiveTint)
                                    Capsule()
                                        .fill(activeTint)
                                        .opacity(
                                            activeIndex == index ? 1 - indicatorProgress :
                                            nextIndex == index ? indicatorProgress : 0
                                        )
                                }
                            }
                    }
                }
                .frame(width: scrollViewWidth)
                .offset(x: -minX)
            }
        }
        .frame(height: 30)
    }
}
