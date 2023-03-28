//
//  SignupView.swift
//  ChatGPYTryouts
//
//  Created by Ulaş Sancak on 26.03.2023.
//

import SwiftUI
import ComposableArchitecture
import ScreenSpotCore

struct SignupView: View {
    let store: StoreOf<Signup>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Spacer()
                Image("signup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 40)
                TextField("Email", text: viewStore.binding(
                    get: { $0.email },
                    send: Signup.Action.emailChanged
                ))
                .padding(12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.bottom, 16)
                SecureField("Password", text: viewStore.binding(
                    get: { $0.password },
                    send: Signup.Action.passwordChanged
                ))
                .padding(12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.bottom, 16)
                NavigationLink(destination: LoginView()) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                }
                .disabled(viewStore.isLoading)
                .padding(.bottom, 30)
                Button(action: {
                    viewStore.send(.alreadyHaveAccountButtonTapped)
                }) {
                    Text("Already have an account?")
                        .font(.headline)
                }
                Spacer()
            }
            .padding(.horizontal, 50)
            .alert(
                item: viewStore.binding(
                    get: { $0.alert },
                    send: Signup.Action.alertDismissed
                )
            ) { alert in
                Alert(title: Text(alert.title), message: Text(alert.message ?? TextState("")))
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignupView(store: .init(initialState: Signup.State(), reducer: Signup()._printChanges()))
        }
    }
}
