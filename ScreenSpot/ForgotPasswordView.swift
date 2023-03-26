//
//  ForgotPasswordView.swift
//  ChatGPYTryouts
//
//  Created by Ulaş Sancak on 26.03.2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image("forgot")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 40)
            Text("Forgot your password?")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Enter your email address and we'll send you a link to reset your password.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            TextField("Email", text: $email)
                .padding(12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.bottom, 16)
            Button(action: {
                // Send password reset link button action
            }) {
                Text("Send password reset link")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .padding(.bottom, 30)
            Spacer()
        }
        .padding(.horizontal, 50)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
