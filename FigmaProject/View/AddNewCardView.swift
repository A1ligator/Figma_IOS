import SwiftUI

struct AddNewCardView: View {
    @Environment(PaymentViewModel.self) var viewModel
    
    var body: some View {
        Text("Hello, World!")
            .navigationTitle("Добавление новой карты")
    }
}

#Preview {
    AddNewCardView()
}
