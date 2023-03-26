//
//  SignupView.swift
//  ChatGPYTryouts
//
//  Created by Ulaş Sancak on 26.03.2023.
//

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image("signup")
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
                // Sign up button action
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .padding(.bottom, 30)
            Button(action: {
                // Already have an account button action
            }) {
                Text("Already have an account?")
                    .font(.headline)
            }
            Spacer()
        }
        .padding(.horizontal, 50)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
