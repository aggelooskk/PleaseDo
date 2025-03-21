//
//  ListView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 13/2/25.
//

import SwiftUI

struct ListView: View {
    let title: String
    @Binding var items: [Item]
    @Binding var shouldReDraw: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            if shouldReDraw {
                EmptyView()
            }
            
            Text(title)
                .font(.title3)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 32)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.orange)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 2)
                        }
                }
                .padding(.horizontal)
                .padding(.top)
            
            List($items) { $item in
                NavigationLink(value: NavPath.details(item)) {
                    ListItemView(item: item, height: 100)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ListView(title: "To Do", items: .constant([
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now + 5, status: .todo, priority: .low),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now + 10, status: .inProgress, priority: .medium),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now + 10, status: .done, priority: .high),
    ]), shouldReDraw: .constant(true))
}
