//
//  LoginTitleView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 19/2/25.
//

import SwiftUI

struct LoginTitleView: View {
    var body: some View {
        HStack() {
            Spacer()
            
            Image("PleaseDoLogo")
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 3) {
                Text("Please Do")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(maxWidth: 175,
                           maxHeight: 0.7)
                    .foregroundStyle(.gray)
                
                Text("A better To Do List")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
        }
        .frame(maxHeight: 110)
        .padding(.horizontal)
    }
}

#Preview {
    LoginTitleView()
}
