import SwiftUI

struct SelectReasonView: View {
    @State private var reasons: [String] = [
        "Мне не интересен контент",
        "Подписка слишком дорогая",
        "Приложение не оправдало моих ожиданий",
        "Я больше не пользуюсь приложением",
        "Другое"
    ]
    
    @State private var anotherReason = ""
    @State private var showAnotherSheet = false
    @State private var selectedReason: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            List(reasons, id: \.self) { reason in
                HStack {
                    Text(reason)
                        .font(.gilroyCell)
                    Spacer()
                    if reason == selectedReason {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.redOrange)
                    }
                }
                .onTapGesture {
                    self.selectedReason = reason
                }
            }
            Button {
                if selectedReason == "Другое" {
                    showAnotherSheet = true
                } else {
                    UserDefaultsService.shared.removeSubscription()
                    dismiss()
                    SharedStorage.shared.showOff = true
                }
            } label: {
                if selectedReason == "" {
                    CapsuleLink(text: "Сохранить",
                                colors: [.inactiveOrangeBtn])
                } else {
                    CapsuleLink(text: "Сохранить",
                                colors: [.buttonLeft, .buttonRight])
                }
            }
            .disabled(selectedReason == "")
            .padding(.horizontal)
            
        }
        .sheet(isPresented: $showAnotherSheet) {
            AnotherSheet()
        }
    }
    
    
    @ViewBuilder
    func AnotherSheet() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    showAnotherSheet = false
                } label: { Image(systemName: "chevron.left") }
                Text("Другое")
            }
            TextField("Опишите причину отмены",
                      text: $anotherReason)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 14)
                    .fill(.white)
            }
            Text("\(anotherReason.count)/120")
                .padding(.horizontal)
                .foregroundStyle(.grayText)
            Spacer()
            Button {
                if anotherReason.count <= 120 {
                    UserDefaultsService.shared.removeSubscription()
                    dismiss()
                    SharedStorage.shared.showOff = true
                }
            } label: {
                if !(1...120 ~= anotherReason.count) {
                    CapsuleLink(text: "Сохранить",
                                colors: [.inactiveOrangeBtn])
                } else {
                    CapsuleLink(text: "Сохранить",
                                colors: [.buttonLeft, .buttonRight])
                }
            }
            .disabled(!(1...120 ~= anotherReason.count))

        }
        .padding()
        .presentationDetents([.medium])
    }
}

#Preview {
    SelectReasonView()
}
