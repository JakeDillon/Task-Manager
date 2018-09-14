//
//  manager.swift
//  Task Manager
//
//  Created by Jake Dillon on 9/12/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation

class Manager {
    
    
    private var taskArray: [Task] = [Task(taskName: "cook supper", priority: 7), Task(taskName: "feed dog", priority: 1), Task(taskName: "listen to music", priority: 9), Task(taskName: "buy food", priority: 3), Task(taskName: "kick neighbor's cat", priority: 10)]
    
    func addTask() {
        
        print("Please enter new task: ")
        
        var newTask = readLine()!
        
        while newTask == nil || newTask == "" {
            print("invalid task please try again")
            newTask = readLine()!
        }
        
    
        
        let newTaskObject = Task(taskName: newTask, priority: <#T##Int#>)
        
    }
    func removeTask() {
        
        var input: String? = nil
        
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid Input")
            }
        } while input == nil
        
       
            var userInput = Int(readLine()!)
            
            while userInput == nil {
                print("invalid input, please use a usable index")
                userInput = Int(readLine()!)
            }
            taskArray.remove(at: userInput!)
        }
    
    func listAvailableTasks() {
        
        for task in taskArray {
            if task.checkedIn{
                print(task.taskName)
            }
        }
}
    
    func listUnavailableTasks() {
        
        for task in taskArray {
            if task.checkedIn == false {
                print(task.taskName)
                if let dueDate = task.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy"
                    print(dateFormatter.string(from: dueDate))
                }
            }
        }
        
    }
    
}



