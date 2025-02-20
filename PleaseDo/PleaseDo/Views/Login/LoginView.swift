//
//  LoginView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 19/2/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            Text("Login")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            LoginFields()
            
            HStack {
                Spacer()
                
                LoginButton(title: "Login") {
                    print("Login button tapped")
                }
            }
            .padding(.horizontal)
           
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
