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
                ListView(title: "To Do")
                
                ListView(title: "In Progress")
                
                ListView(title: "Done!")
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
