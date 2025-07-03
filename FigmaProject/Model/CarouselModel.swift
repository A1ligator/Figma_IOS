import Foundation

struct CarouselModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let subtitle: String
    let imageName: String
    let colorName: String
}

