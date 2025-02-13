//
//  HomeView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 13/2/25.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            TabView {
                Text("page 1")
                
                Text("page 2")
                
                Text("page 3")
            }
            .tabViewStyle(.page)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("logout")
                    } label: {
                        Image(systemName: "person.circle")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Navigate to new item")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: String.self) { _ in
                Text("New view here")
            }
        }
    }
}

#Preview {
    HomeView()
}
