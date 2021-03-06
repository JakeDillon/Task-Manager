//
//  manager.swift
//  Task Manager
//
//  Created by Jake Dillon on 9/12/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation

class Manager {
    
    
    private var taskArray: [Task] = [Task(taskName: "cook supper", priority: .low), Task(taskName: "feed dog", priority: .low), Task(taskName: "listen to music", priority: .low), Task(taskName: "buy food", priority: .average), Task(taskName: "kick neighbor's cat", priority: .high)]
    
    func addTask() {
        
        print("Please enter new task: ")
        
        var newTask = readLine()!
        
        while newTask == nil || newTask == "" {
            print("invalid task please try again")
            newTask = readLine()!
        }
        var taskPriority : Task.priorityChoice!
        print("state priority of task: High, Average, Low")
        let priorityInput = getPriority()
        if priorityInput == "High" {
            
            taskPriority = .high
            
        } else if priorityInput == "Average" {
            
            taskPriority = .average
            
        } else if priorityInput == "Low" {
            
            taskPriority = .low
        }
        var dueDate: Date?
        
        taskArray.append(Task(taskName: newTask, priority: taskPriority))
        
    }
    func removeTask() {
        
        for (i, task) in taskArray.enumerated() {
            
            print("\(i) \(task.taskName)")
            
        }
        
        print("\n")
        
        print("select number of task you want to remove")
        
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
    
    func completeTask() { //completed task
        
        for index in 0..<taskArray.count {
            
            if taskArray[index].checkedIn == true {
                print("\(index). \(taskArray[index].taskName)")
            }
        }
        print("mark incompleted task")
        
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("invalid input, please enter a usable index")
            userInput = Int(readLine()!)
        }
        if taskArray[userInput!].checkedIn == false {
            print("task is already completed")
        } else {
            
            taskArray[userInput!].checkedIn = false
            
            let currentCalendar = Calendar.current
            let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
            taskArray[userInput!].dueDate = dueDate
            for task in taskArray {
                if task.checkedIn == false {
                    print(task.taskName)
                    print("finish task by")
                    if let dueDate = task.dueDate {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MM-dd-yyyy"
                        print(dateFormatter.string(from: dueDate))
                    }
                }
            }
        }
    }
    func incompleteTask() { //incompleted task
        for index in 0..<taskArray.count {
            if taskArray[index].checkedIn == false {
                
                
                print("\(index). \(taskArray[index].taskName)")
            }
        }
        print("please enter the index of your completed task")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("invalid input, please enter a usable index")
            userInput = Int(readLine()!)
        }
        if taskArray[userInput!].checkedIn == true {
            print("task is already completed")
        } else {
            taskArray[userInput!].checkedIn = true
            taskArray[userInput!].dueDate = nil
            print("Your task is not completed")
        }
    }

    func listAvailableTaks() {
        
        for task in taskArray {
            if task.checkedIn{
                print(task.taskName)
            }
        }
        
    }
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


}



