//
//  OnboardingView.swift
//  ChatGPYTryouts
//
//  Created by Ulaş Sancak on 26.03.2023.
//

import SwiftUI
import ScreenSpotCore

struct OnboardingView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("onboarding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 40)
                Text("Welcome to the Personalized Entertainment App")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text("Get personalized recommendations and discover new forms of entertainment that you'll love.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                NavigationLink(destination: SignupView(store: .init(initialState: Signup.State(), reducer: Signup()))) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                }
                .padding(.bottom, 30)
                NavigationLink(destination: LoginView()) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                Spacer()
            }
            .padding(.horizontal, 50)
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
