import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                switch SharedStorage.shared.settings.subState {
                case .unsubscripted:
                    NavigationLink {
                        SubscriptionView()
                            .preferredColorScheme(.dark)
                    } label: {
                        PremiumCardView()
                    }
                case .subscripted(_):
                    SubscriptionCardView()
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Личные данные").font(.gilroyTitle)
                    VStack(spacing: 0) {
                        NavigationLink {
                            Text("Профиль")
                        } label: {
                            HStack {
                                Text("Профиль")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.lightGray)
                            }
                        }
                        .padding(.vertical, 17)
                        Divider()
                        NavigationLink {
                            Text("Биометрия")
                        } label: {
                            HStack {
                                Text("Биометрия")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.lightGray)
                            }
                        }
                        .padding(.vertical, 17)
                        Divider()
                        
                        NavigationLink {
                            Text("Приватность")
                        } label: {
                            HStack {
                                Text("Приватность")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.lightGray)
                            }
                        }
                        .padding(.vertical, 17)
                        Divider()
                        
                        NavigationLink {
                            Text("Тест на совместимость")
                        } label: {
                            HStack {
                                Text("Тест на совместимость")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.lightGray)
                            }
                        }
                        .padding(.vertical, 17)
                        
                    }
                    .font(.gilroyCell)
                    .padding(.horizontal, 16)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                
                VStack(spacing: 0) {
                    NavigationLink {
                        Text("Способ оплаты")
                    } label: {
                        HStack {
                            Text("Способ оплаты")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.lightGray)
                        }
                    }
                    .padding(.vertical, 17)
                    Divider()
                    NavigationLink {
                        Text("История операций")
                    } label: {
                        HStack {
                            Text("История операций")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.lightGray)
                        }
                    }
                    .padding(.vertical, 17)
                }
                .font(.gilroyCell)
                .padding(.horizontal, 16)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
        }
        .padding(.horizontal)
        .background(.bgGray)
        .frame(maxWidth: .infinity)
        .onAppear {
            SharedStorage.shared.refreshData()
        }
        .overlay(alignment: .bottom) {
            if SharedStorage.shared.showOn {
                NotifyView(notify: .autoRenewOn)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            SharedStorage.shared.showOn = false
                        }
                    }
            }
            if SharedStorage.shared.showOff {
                NotifyView(notify: .autoRenewOff)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            SharedStorage.shared.showOff = false
                        }
                    }
            }
            if SharedStorage.shared.showChangeCard {
                NotifyView(notify: .cardChanged)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            SharedStorage.shared.showChangeCard = false
                        }
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
