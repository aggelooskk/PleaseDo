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
    
    var body: some View {
        VStack(spacing: 0) {
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
                Text(item.title)
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ListView(title: "To Do", items: .constant([
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now),
    ]))
}
