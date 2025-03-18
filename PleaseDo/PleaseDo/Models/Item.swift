//
//  Item.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 13/2/25.
//

import Foundation
import FirebaseFirestore

struct Item: Identifiable, Equatable, Hashable {
    let id: String
    let authorId: String
    var title: String
    var description: String
    var startDate: Date = .now
    var status: Status
    var priority: Priority
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
    
    func isDifferent(comparedTo item: Item) -> Bool {
        return id != item.id
        || authorId != item.authorId
        || title != item.title
        || description != item.description
        || startDate != item.startDate
        || status != item.status
        || priority != item.priority
    }
    
    init(data: [String: Any]) {
        id = data["id"] as! String
        authorId = data["authorId"] as! String
        title = data["title"] as! String
        description = data["description"] as! String
        
        let timestamp = data["startDate"] as! Timestamp
        startDate = timestamp.dateValue()
        
        let statusString = data["status"] as! String
        status = Status(statusString)
        
        let priorityString = data["priority"] as! String
        priority = Priority(priorityString)
    }
    
    init(id: String, authorId: String, title: String, description: String, startDate: Date, status: Status, priority: Priority) {
        self.id = id
        self.authorId = authorId
        self.title = title
        self.description = description
        self.startDate = startDate
        self.status = status
        self.priority = priority
    }
    
    static func empty() -> Item {
        return Item(id: "", authorId: "", title: "", description: "", startDate: .now, status: .todo, priority: .low)
    }
    
    func toObject() -> [String: Any] {
        var data: [String: Any] = [:]
        data["id"] = id
        data["authorId"] = authorId
        data["title"] = title
        data["description"] = description
        data["startDate"] = Timestamp(date: startDate)
        data["status"] = status.rawValue
        data["priority"] = priority.rawValue
        
        return data
    }
}
