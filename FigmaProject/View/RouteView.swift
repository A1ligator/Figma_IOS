import SwiftUI

struct RouteView: View {
    var body: some View {
        
        switch SharedStorage.shared.settings.subState {
        case .unsubscripted:
            NavigationStack {
                NavigationLink("Работа с подпиской") {
                    ProfileView()
                        .padding(.top, 20)
                }
            }
        case .subscripted(let sub):
            NavigationStack {
                NavigationLink("Работа с подпиской") {
                    ProfileView()
                        .padding(.top, 20)
                }
            }
        }
        
        
    }
}

#Preview {
    RouteView()
}
