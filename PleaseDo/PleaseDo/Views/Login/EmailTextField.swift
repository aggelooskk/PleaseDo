//
//  EmailTextField.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 20/2/25.
//

import SwiftUI

struct EmailTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack() {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(height: 15)
            
            TextField(placeholder, text: $text )
                .submitLabel(.done)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .background(.clear)
        }
        .padding(8)
        .background(
                  RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 0.3)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.background)
                    )
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    EmailTextField(placeholder: "email", text: .constant(""))
}
