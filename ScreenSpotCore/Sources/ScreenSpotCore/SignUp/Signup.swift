//
//  Signup.swift
//  
//
//  Created by Ulaş Sancak on 28.03.2023.
//

import Foundation
import ComposableArchitecture

public enum SignupError: LocalizedError, Equatable {
    case invalidEmail
    case invalidPassword
    case serverError(String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return "Invalid email format."
        case .invalidPassword:
            return "Password must be at least 8 characters."
        case let .serverError(message):
            return "Server error: \(message)"
        }
    }
}

public struct Signup: ReducerProtocol {
    
    public init() {}
    
    public struct State: Equatable {
        public var email: String = ""
        public var password: String = ""
        public var alert: AlertState<Action>? = nil
        public var isLoading = false

        public var isValid: Bool {
            !email.isEmpty && !password.isEmpty
        }
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case emailChanged(String)
        case passwordChanged(String)
        case signupButtonTapped
        case signupResponse(Result<String, SignupError>)
        case alertDismissed
        case alreadyHaveAccountButtonTapped
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .emailChanged(let email):
            state.email = email
            return .none
        case .passwordChanged(let password):
            state.password = password
            return .none
        case .signupButtonTapped:
            return .none
        case .signupResponse(.success(let successMessage)):
            state.alert = .init(title: TextState(successMessage))
            return .none
        case .signupResponse(.failure(let error)):
            state.alert = .init(title: TextState(error.localizedDescription))
            return .none
        case .alertDismissed:
            state.alert = nil
            return .none
        case .alreadyHaveAccountButtonTapped:
            return .none
        }
    }
}
