//
//  add tasks.swift
//  Task Manager
//
//  Created by Jake Dillon on 9/12/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation
class Task {
    
    var taskName: String
    var priority: priorityChoice
    enum priorityChoice: Int{
        case high = 1
        case average
        case low
    }
    
    var checkedIn = true
    
    var dueDate: Date?
    
    
    
    init(taskName: String, priority: priorityChoice) {
        self.taskName = taskName
        self.priority = priority
        
    }
}
