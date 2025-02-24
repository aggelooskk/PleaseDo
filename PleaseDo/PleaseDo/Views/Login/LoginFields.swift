//
//  LoginFields.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 20/2/25.
//

import SwiftUI

struct LoginFields: View {
    @Binding var email: String
    @Binding var pw: String
    
    var body: some View {
        VStack(spacing: 12) {
            EmailTextField(placeholder: "user@mail.com", text: $email)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
            
            PasswordField(placeholder: "pasword", text: $pw)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
        }
        .padding(.horizontal)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LoginFields(email: .constant(""), pw: .constant(""))
}
