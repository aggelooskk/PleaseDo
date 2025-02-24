//
//  KeyboardView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 24/2/25.
//

import SwiftUI

struct KeyboardView: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(.roundedBorder)
            .submitLabel(.done)
            .textInputAutocapitalization(.words)
            .keyboardType(.default)
            .background(Color.clear)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    KeyboardView(placeholder: "First name", text: .constant(""))
}
