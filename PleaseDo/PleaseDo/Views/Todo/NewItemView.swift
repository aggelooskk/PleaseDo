//
//  NewItemView.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 17/2/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject private var vm = NewItemVM()
    @Binding var path: [NavPath]
    
    var body: some View {
        VStack(spacing: 10) {
            
            Spacer()
            
            TitledTextField(title: "Status", placeholder: "What do you need to do", text: $vm.newItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a breef descriptio ", text: $vm.newItem.description)
            
            Divider()
            
            StatusMenu(status: $vm.newItem.status)
            
            Divider()
            
            PriorityMenu(priority: $vm.newItem.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm") {
                vm.saveNewItem()
            }
            .alert("Alert", isPresented: $vm.saveItemError) {
                Button("Dismiss", role: .cancel) {}
            } message: {
                Text("Error saving new item.")
            }
            .alert("Success!", isPresented: $vm.didSaveItem) {
                Button("Dissmiss", role: .cancel) {
                    path.removeLast()
                }
            } message: {
                Text("New item saved succesfully")
            }
        }
        .padding(.horizontal)
        }
    }
                      
#Preview {
    NewItemView(path: .constant([]))
 }
