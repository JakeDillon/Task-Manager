//
//  add tasks.swift
//  Task Manager
//
//  Created by Jake Dillon on 9/12/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation
class Task {
    
    var priority: Int
    var taskName: String
    
    var checkedIn = true
    
    var dueDate: Date?
    
    init(taskName: String, priority: Int) {
        self.taskName = taskName
        self.priority = priority
    }
}
