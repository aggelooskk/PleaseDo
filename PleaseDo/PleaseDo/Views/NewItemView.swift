//
//  NewItemView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 17/2/25.
//

import SwiftUI

struct NewItemView: View {
    @State private var text = ""
    @State private var description = ""
    @State private var item = Item(id: "abc123", authorId: "dsdfsa", title: "Test", description: "Test", status: .todo, priority: .low)
    
    var body: some View {
        VStack(spacing: 10) {
            TitledTextField(title: "Status", placeholder: "What do you need to do", text: $text)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a breef descriptio ", text: $description)
            
            Divider()
            
            StatusMenu(status: $item.status)
            
            Divider()
            
            PriorityMenu(priority: $item.priority)
        }
    }
}

#Preview {
    NewItemView()
}
