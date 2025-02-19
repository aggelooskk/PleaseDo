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
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 3) {
                Text(item.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(item.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "circle")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.blue)
                .frame(maxHeight: height * 0.45)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(item: Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now + 5, status: .todo, priority: .low), height: 100)
}
