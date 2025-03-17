//
//  ItemDetailsView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 17/2/25.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    @State private var updatedItem = Item(id: "abc123", authorId: "dsdfsa", title: "Test", description: "Test", startDate: .now, status: .todo, priority: .low)
    
    var body: some View {
        VStack(spacing: 10) {
            TitledTextField(title: "Status", placeholder: "What do you need to do", text: $updatedItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a breef descriptio ", text: $updatedItem.description)
            
            Divider()
            
            StatusMenu(status: $updatedItem.status)
            
            Divider()
            
            PriorityMenu(priority: $updatedItem.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm") {
                print("ctabutton tapped")
            }
        }
        .padding()
        .navigationTitle("Details")
    }
}

#Preview {
    ItemDetailsView(item:  Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now, status: .todo, priority: .low))
}
