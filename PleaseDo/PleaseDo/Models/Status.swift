//
//  Status.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 18/3/25.
//

import Foundation

enum Status: String, CaseIterable {
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
    case unknown = "Uknown"
    
    init(_ str: String) {
        self = switch str.lowercased() {
        case "to do": .todo
        case "in progress": .inProgress
        case "done": .done
        default: .unknown
        }
    }
}
