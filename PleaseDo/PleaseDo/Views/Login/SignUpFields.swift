//
//  SignUpFields.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 24/2/25.
//

import SwiftUI

struct SignUpFields: View {
    @Binding var fname: String
    @Binding var lname: String
    @Binding var email: String
    @Binding var pw: String

    var body: some View {
        VStack(spacing: 12) {
            KeyboardView(placeholder: "First Name", text: $fname)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
            
            KeyboardView(placeholder: "Last Name", text: $lname)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
            
            EmailTextField(placeholder: "user@mail.com", text: $email)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
            
            PasswordField(placeholder: "pasword", text: $pw)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
        }
        .padding(.horizontal)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SignUpFields(fname: .constant(""), lname: .constant(""), email: .constant(""), pw: .constant(""))
}
