//
//  NewItemView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 17/2/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject private var vm = NewItemVM()
    
    var body: some View {
        VStack(spacing: 10) {
            
            Spacer()
            
            TitledTextField(title: "Status", placeholder: "What do you need to do", text: $vm.newItem.text)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a breef descriptio ", text: $vm.newItem.description)
            
            Divider()
            
            StatusMenu(status: $vm.newItem.status)
            
            Divider()
            
            PriorityMenu(priority: $vm.newItem.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm") {
                Task {
                    do {
                        try await vm.saveNewItem()
                    } catch {
                        
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NewItemView()
}
