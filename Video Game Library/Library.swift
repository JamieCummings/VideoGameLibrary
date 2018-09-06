//
//  Library.swift
//  Video Game Library
//
//  Created by Jamie Cummings on 9/4/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation

//  this class will handle storing our array of Games. it will also handle all the interactions with that array.

class Library {
    fileprivate var gameArray: [Game] = [Game(title: "Just Dance"), Game(title: "Zelda"), Game(title: "Duck Hunt")]
    // an array of Game objects
    
    func addGame(){
        //TODO:- add func to add a new game to the gameArray
        print("Add new title here:")
        
        var input: String? = nil
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input")
            }
        } while input == nil
        
        gameArray.append(Game(title: input!))
        print("\n")
        
        for game in gameArray {
            print(game.title)
        }
        print("\n")
    }
    
    func removeGames(){
        //TODO:- add func to remove games
        print("Please enter a game to remove:")
        for (i,index) in gameArray.enumerated(){
            print("\(i+1). \(index.title)")
        }
        if let input = Int(readLine()!){
            if input > 0 && input < gameArray.count{
                gameArray.remove(at: input - 1)
            } else {
                print("please choose a correct number!")
            }
        } else {
            print("please choose a correct number!")
        }
        print("")
        print("Current games in library: \n")
        for game in gameArray {
            print(game.title)
        }
        print("")
    }
    
    func listAvaiableGames(){
        print("Games that are avaible:")
        for game in gameArray {
            if game.checkedIn == true {
                print(game.title)
            }
            
        }
        print("\n")
    }
    
    func listUnavaiableGames() {
        //TODO:- add func to list games that are checked out from the gameArray
        print("Following games are unavaiable:")
        for game in gameArray {
            if game.checkedIn == false {
                print(game.title)
                if let dueDate = game.dueDate{
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print(dateFormatter.string(from: dueDate))
                }
            }
            
        }
        print("\n")
    }
    
    
    func checkGameOut(){
        //TODO:- add func to check game out
        print("What game would you like to check out?")
        
        var checkList = false
        for game in gameArray {
            if game.checkedIn == false {
                checkList = true
            }
        }
        if !checkList {
            return print("There are no games available to check in.")
        }
       
        for (i, index) in gameArray.enumerated() {
            if index.checkedIn == true {
                
                print("\(i + 1) \(index.title)")
            }
        }
        
        print("\n")
        
        print("Please enter in a number corresponding to the game you want to check out:")
        
        if let input = Int(readLine()!) {
            
            if input > 0 && input < gameArray.count {
                
                gameArray[input - 1].checkedIn = false
                let currentCalendar = Calendar.current
                let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
                gameArray[input - 1].dueDate = dueDate
                if let dueDate = dueDate{
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("your game is due back on \(dateFormatter.string(from: dueDate))")
                }
                
                
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count - 1)")
            }
        }
    }
    func checkGameIn(){
        //TODO:- add func to check game in
        print("What game would you like to check in?")
        
        var checkList = false
        for game in gameArray {
            if game.checkedIn == false {
                checkList = true
            }
        }
        if !checkList {
            return print("There are no games available to check in.")
        }
        
        for (i, index) in gameArray.enumerated() {
            if index.checkedIn == false{
                
                print("\(i + 1) \(index.title)")
            }
        }
        
        print("\n")
        
        print("Please enter in a number corresponding to the game you want to check in:")
        
        if let input = Int(readLine()!) {
            
            if input > 0 && input < gameArray.count {
                
                gameArray[input - 1].checkedIn = true
                gameArray[input - 1].dueDate = nil
                print("These are available for check out:")
                print("")
                for game in gameArray{
                    if game.checkedIn == true {
                        print(game.title)
                    }
                }
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count) \n")
                checkGameIn()
            }
        }
        
    }
}


