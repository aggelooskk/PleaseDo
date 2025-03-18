//
//  LoginVM.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 24/2/25.
//

import Foundation

final class LoginVM: ObservableObject {
    private let auth = LoginManager()
    
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
    
    @Published var email = ""
    @Published var pw = ""
    
    @Published var newEmail = ""
    @Published var newPw = ""
    @Published var fname = ""
    @Published var lname = ""
    
    init() {
        auth.delegate = self
    }
    
    func didTapLoginButton() {
        if isLoggingIn {
            auth.signIn(email, pw)
        } else {
            auth.signUp(fname, lname, newEmail, newPw)
        }
    }
    
    func signOut() {
        auth.signOut()
    }
}

extension LoginVM: LoginManagerDelegate {
    func authStateDidChange(isLoggedIn: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            loginStatus = isLoggedIn ? .loggedIn : .loggedOut
        }
    }
}
