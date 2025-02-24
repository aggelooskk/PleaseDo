//
//  LoginVM.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 24/2/25.
//

import Foundation

final class LoginVM: ObservableObject {
    
    enum Status {
        case unknown, loggedIn, loggedOut
    }
    
    @Published var loginStatus: Status = .unknown
    
    @Published var isLoggingIn = true {
        didSet {
            if isLoggingIn {
                titleText = "Login"
                toggleText = "Don't have an account?"
                prompt = "Sign up here"
            } else {
                titleText = "Sign up"
                toggleText = "Already a user?"
                prompt = "Login here"
            }
        }
    }
    
    @Published var titleText = "Login"
    
    @Published var toggleText = "Don't have an account?"
    @Published var prompt = "Sign up here"
}
