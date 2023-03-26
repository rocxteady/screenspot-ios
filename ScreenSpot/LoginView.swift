//
//  LoginView.swift
//  ChatGPYTryouts
//
//  Created by Ulaş Sancak on 26.03.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showForgotPassword = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("login")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 40)
            TextField("Email", text: $email)
                .padding(12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.bottom, 16)
            SecureField("Password", text: $password)
                .padding(12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.bottom, 16)
            Button(action: {
                // Log in button action
            }) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .padding(.bottom, 16)
            Button(action: {
                self.showForgotPassword = true
            }) {
                Text("Forgot password?")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            }
            Spacer()
        }
        .sheet(isPresented: $showForgotPassword) {
            ForgotPasswordView()
        }
        .padding(.horizontal, 50)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
