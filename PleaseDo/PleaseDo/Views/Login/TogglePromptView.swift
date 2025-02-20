//
//  TogglePromptView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 20/2/25.
//

import SwiftUI

struct TogglePromptView: View {
    @Binding var text: String
    @Binding var prompt: String
    @Binding var isloggingIn: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Text(text)
            
            Button(prompt) {
                isloggingIn.toggle()
            }
            
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TogglePromptView(text: .constant("Do not have an account?"), prompt: .constant("Sign up here"), isloggingIn: .constant(true))
}
