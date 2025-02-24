//
//  LoginView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 19/2/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginVM()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            Text(vm.titleText)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            if vm.isLoggingIn {
                LoginFields()
            } else {
                SignUpFields()
            }
            
            HStack {
                Spacer()
                
                LoginButton(title: vm.titleText) {
                    print("Login button tapped")
                }
            }
            .padding(.horizontal)
           
            Spacer()
            
            TogglePromptView(text: $vm.toggleText, prompt: $vm.prompt, isloggingIn: $vm.isLoggingIn)
        }
    }
}

#Preview {
    LoginView()
}
