//
//  LoginButton.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 20/2/25.
//

import SwiftUI

struct LoginButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(
                        LinearGradient(colors: [.gray, .lightGray], startPoint: .leading, endPoint: .trailing)
                    )
                
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 30, maxHeight: 30)
                    .padding(.trailing)
                    .foregroundStyle(.gray)
            }
        }
        .background(
            LinearGradient(colors: [.dullBlue, .lightBlue], startPoint: .leading, endPoint: .trailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LoginButton(title: "Login") {}
}
