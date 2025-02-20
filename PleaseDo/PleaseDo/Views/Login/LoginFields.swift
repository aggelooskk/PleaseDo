//
//  LoginFields.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 20/2/25.
//

import SwiftUI

struct LoginFields: View {
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: 12) {
            EmailTextField(placeholder: "user@mail.com", text: $email)
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginFields()
}
