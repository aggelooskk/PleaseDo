//
//  PriorityMenu.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 18/2/25.
//

import SwiftUI

struct PriorityMenu: View {
    @Binding var priority: Priority 
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Priority:")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
                Picker("Priority", selection: $priority) {
                    ForEach(Priority.allCases, id: \.self) {
                        if $0 == .unknown {
                            EmptyView()
                        } else {
                            Text($0.rawValue)
                        }
                    }
                }
                .pickerStyle(.menu)
            }
            
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PriorityMenu(priority: .constant(.low))
}
