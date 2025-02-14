//
//  ListItemView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 14/2/25.
//

import SwiftUI

struct ListItemView: View {
    let item: Item
    let height: CGFloat
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ListItemView(item: Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now + 5, status: .todo, priority: .low), height: 100)
}
