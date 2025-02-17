//
//  ItemDetailsView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 17/2/25.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text(item.title)
            
            Text(item.description)
            
            Text(item.status.rawValue)
            
            Text(item.priority.rawValue)
        }
    }
}

#Preview {
    ItemDetailsView(item:  Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now, status: .todo, priority: .low))
}
