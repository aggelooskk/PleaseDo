//
//  Priority.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 18/3/25.
//

import Foundation

enum Priority: String, CaseIterable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case unknown = "Unknown"
    
    init(_ str: String) {
        self = switch str.lowercased() {
        case "low": .low
        case "medium": .medium
        case "high": .high
        default: .unknown
        }
    }
}
