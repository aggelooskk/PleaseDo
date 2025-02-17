//
//  HomeView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 13/2/25.
//

import SwiftUI

struct HomeView: View {
    @State private var path: [NavPath] = []
    
    @State private var todoItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now, status: .inProgress, priority: .medium),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now + 5, status: .done, priority: .high),
    ]
    
    @State private var inProgressItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now, status: .inProgress, priority: .medium),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now + 10, status: .done, priority: .high),
    ]
    
    @State private var doneItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now, status: .inProgress, priority: .medium),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now + 10, status: .done, priority: .high),
    ]
    
    
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                TabView {
                    ListView(title: "To Do", items: $todoItems)
                    
                    ListView(title: "In Progress", items: $inProgressItems)
                    
                    ListView(title: "Done", items: $doneItems)
                }
                .tabViewStyle(.page)
            }
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
                        path.append(NavPath.newItem)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: NavPath.self) { path in
                switch path {
                case .newItem:
                    Text("New item view here")
                case .details:
                    Text("Item details view here")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
