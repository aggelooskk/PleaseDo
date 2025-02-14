//
//  HomeView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 13/2/25.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    
    @State private var todoItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now),
    ]
    
    @State private var inProgressItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now),
    ]
    
    @State private var doneItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now),
    ]
    
    
    
    var body: some View {
        NavigationStack {
            TabView {
                ListView(title: "To Do", items: $todoItems)
                
                ListView(title: "In Progress", items: $inProgressItems)
                
                ListView(title: "Done", items: $doneItems)
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
