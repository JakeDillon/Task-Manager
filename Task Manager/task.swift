//
//  task.swift
//  Task Manager
//
//  Created by Jake Dillon on 9/14/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation

class Task {
    
    var taskName: String
    var priority: String
    
    var checkedIn = true
    
    var dueDate: Date?
    var taskPriority: Task.PriorityChoice!
    
    let priorityInput = getPriority()
    
    if priorityInput == "High" {
    
    taskPriority = .High
    
    } else if priorityInput == "Average" {
    
    taskPriority = .Average
    
    } else if priorityInput == "Low" {
    taskPriority = .Low
    }
    
    taskArray.append(Task(title: taskName, description: taskDescription, priority: taskPriority))
    
    func getPriority() -> String {
        
        var input: String? = nil
        
        repeat {
            
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line == "Low" || line == "Average" || line == "High"  {
                
                input = line
                
            } else {
                
                print("Invalid input")
            }
            
        } while input == nil
        
        return input!
    }
    
    init(taskName: String, priority: Int) {
        self.taskName = taskName
        self.priority = priority
        
    }
}
