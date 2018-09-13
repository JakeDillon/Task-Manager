//
//  manager.swift
//  Task Manager
//
//  Created by Jake Dillon on 9/12/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation

class Library {
    
    
    private var gameArray: [Game] = [Game(title: "Fire Pro Wrestling: World", rating: "T"), Game(title: "Far Cry 5", rating: "M"), Game(title: "WWF: No Mercy", rating: "T"), Game(title: "Saints Row", rating: "M"), Game(title: "Saw: the game", rating: "M")]
    
    func addTask() {
        
        print("Please enter new task: ")
        
        var newTask = readLine()!
        
        while newTask == nil || newTask == "" {
            print("invalid task please try again")
            newTask = readLine()!
        }
        print("please enter the priority of your new task")
        
        repeat {
            
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line == "e" || line == "t" || line == "m"{
                input = line
            } else {
                print("Invalid input, try again")
                input = nil
            }
        } while input == nil
        
        
    }
    
    
    }
    
    
    
    func removeGame() {
        print("please enter password")
        var input: String? = nil
        
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid Input")
            }
        } while input == nil
        
        if input == "dirty caveman" {
            for index in 0..<gameArray.count {
                print("\(index). \(gameArray[index].title)")
            }
            var userInput = Int(readLine()!)
            
            while userInput == nil {
                print("invalid input, please use a usable index")
                userInput = Int(readLine()!)
            }
            gameArray.remove(at: userInput!)
        } else {
            print("wrong password YOU SUCK!!!!!")
        }
    }
    func listAvailableGames() {
        
        for game in gameArray {
            if game.checkedIn{
                print(game.title)
            }
        }
        
    }
    func listUnavailableGames() {
        
        for game in gameArray {
            if game.checkedIn == false {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy"
                    print(dateFormatter.string(from: dueDate))
                }
            }
        }
        
    }
    func checkGameOut() {
        
        for index in 0..<gameArray.count {
            
            if gameArray[index].checkedIn == true {
                print("\(index). \(gameArray[index].title)")
            }
        }
        print("please enter the index of the game you wish to check out:")
        
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("invalid input, please enter a usable index")
            userInput = Int(readLine()!)
        }
        if gameArray[userInput!].checkedIn == false {
            print("game is already checked out")
        } else {
            
            gameArray[userInput!].checkedIn = false
            
            let currentCalendar = Calendar.current
            let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
            gameArray[userInput!].dueDate = dueDate
            for game in gameArray {
                if game.checkedIn == false {
                    print(game.title)
                    print("Your game is due on")
                    if let dueDate = game.dueDate {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MM-dd-yyyy"
                        print(dateFormatter.string(from: dueDate))
                    }
                }
            }
        }
    }
    
    
    func checkGameIn() {
        for index in 0..<gameArray.count {
            if gameArray[index].checkedIn == false {
                
                
                print("\(index). \(gameArray[index].title)")
            }
        }
        print("please enter the index of the game you wish to check in:")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("invalid input, please enter a usable index")
            userInput = Int(readLine()!)
        }
        if gameArray[userInput!].checkedIn == true {
            print("game is already checked in")
        } else {
            gameArray[userInput!].checkedIn = true
            gameArray[userInput!].dueDate = nil
            print("Your game has been checked in")
        }
    }
    
}
