import SwiftUI

struct PaymentMethodView: View {
    @State var viewModel: PaymentViewModel
    let place: Place
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.cards) { card in
                        CardCell(card: card)
                            .onTapGesture {
                                withAnimation { viewModel.selectedCard = card }
                            }
                    }
                    NavigationLink {
                        AddNewCardView()
                            .environment(viewModel)
                            .colorScheme(.light)
                    } label: {
                        HStack(spacing: 12) {
                            Image("another")
                                .resizable()
                                .frame(width: 30, height: 20)
                            Text("Новая карта").font(.gilroyCell)
                            Spacer()
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .foregroundStyle(.bgGray)
                                    .frame(width: 24, height:  24)
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundStyle(.black)
                                    .frame(width: 12, height: 12)
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.vertical, 20)
                        .padding(.trailing, 16)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    
                }
            }
            .navigationTitle("Способ оплаты")
            .navigationBarTitleDisplayMode(.inline)
            
           
            if place == .addSubscription {
                NavigationLink {
                    //TODO: Перейти на подтверждение оплаты
                    PaymentConfirmView()
                        .environment(viewModel)
                        .colorScheme(.light)
                } label: {
                    CapsuleLink(text: "Оплатить",
                                colors: [.buttonLeft, .buttonRight])
                }
            } else {
                Button {
                    //TODO: Сохранение карты
                    if let card = viewModel.selectedCard {
                        UserDefaultsService.shared.setCard(card)
                    }
                    //TODO: Закрытие экрана
                    dismiss()
                    SharedStorage.shared.showChangeCard = true
                } label: {
                    CapsuleLink(text: "Сохранить",
                                colors: [.buttonLeft, .buttonRight])
                }

            }
        }
        .padding(.horizontal, 16)
        .background(.bgGray)
    }
    
    
    @ViewBuilder func CardCell(card: Card) -> some View {
        HStack(spacing: 12) {
            Image(card.paySystem.imageName)
                .resizable()
                .frame(width: 30, height: 20)
            Text(card.secureNumber).font(.gilroyCell)
            Spacer()
            Image(systemName: viewModel.selectedCard == card ? "checkmark.circle.fill" : "circle.fill")
                .resizable()
                .foregroundStyle(viewModel.selectedCard == card ? .redOrange : .bgGray)
                .frame(width: 24, height: 24)
        }
        .padding(.leading, 20)
        .padding(.vertical, 20)
        .padding(.trailing, 16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    
    enum Place {
        case addSubscription
        case mainScreen
    }
}

//#Preview {
//    NavigationStack {
//        PaymentMethodView()
//    }
//}
