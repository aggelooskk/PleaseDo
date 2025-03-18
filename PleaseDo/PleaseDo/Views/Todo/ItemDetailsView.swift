//
//  ItemDetailsView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 17/2/25.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    @StateObject private var vm = ItemDetailsVM()
    
    var body: some View {
        VStack(spacing: 10) {
            TitledTextField(title: "Status", placeholder: "What do you need to do", text: $vm.updatedItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a breef descriptio ", text: $vm.updatedItem.description)
            
            Divider()
            
            StatusMenu(status: $vm.updatedItem.status)
            
            Divider()
            
            PriorityMenu(priority: $vm.updatedItem.priority)
            
            Spacer()
            
            if vm.initialItem .isDifferent(comparedTo: vm.updatedItem) {
                CTAButton(title: "Confirm") {
                    print("ctabutton tapped")
                }
            }
        }
        .padding()
        .navigationTitle("Details")
        .onAppear {
            vm.initialItem = item
            vm.updatedItem = item
        }
    }
}

#Preview {
    ItemDetailsView(item:  Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now, status: .todo, priority: .low))
}
