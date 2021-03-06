//
//  menu.swift
//  Task Manager
//
//  Created by Jake Dillon on 9/12/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation

class Menu{
    
    var manager = Manager()
    
    var shouldQuit = false
    
    

    func go(){
        help()
        repeat{

            var input = getInput()

            while validateInput(input) == false {
                print("Invalid input")
                input = getInput()
            }
            handleInput(input)
        } while !shouldQuit
    }
    func help() {
        print("""
    Menu
    1. Add New Taks
    2. Delete Task
    3. List All Tasks
    4. Completed Tasks
    5. Uncompleted Tasks
    6. Mark Task as Complete
    7. Mark Task as Incomplete
    8. Help
    9. Quit
    """)
}
    func handleInput(_ input: String) {
        switch input {
        case "1":
            manager.addTask()
            help()
        case "2":
            manager.removeTask()
            help()
        case "3":
            manager.listAvailableTasks()
            help()
        case "4":
            manager.listUnavailableTasks()
            help()
        case "5":
            manager.listAvailableTasks()
            help()
        case "6":
            manager.completeTask()
            help()
        case "7":
            manager.incompleteTask()
            help()
        case "8":
            help()
        case "9":
            quit()
       default:
            break
        }
    }
    func quit() {
        shouldQuit = true
        print("Thanks for using the Task Manager")
    }
    func validateInput(_ input: String) -> Bool {
        let menuOptions = Array(1...9)
        
        guard let number = Int(input) else { return false}
        return menuOptions.contains(number)
    }
    func getInput()-> String {
        var input: String? = nil
        
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid Input")
            }
        } while input == nil
        return input!
    }
}

