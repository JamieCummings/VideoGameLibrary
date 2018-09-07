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
        print ("Please enter a password to add a game.")
        var input: String? = nil
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != " " {
                input = line
            } else {
                print("Invalid input")
            }
        } while input == nil
        
        if input == "Gamer4Lyfe"{
            
            print("Add new title here:")
            
            var gameTitle: String? = nil
            repeat {
                let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
                if line != "" {
                    gameTitle = line
                } else {
                    print("Invalid input")
                }
            } while gameTitle == nil
            
            gameArray.append(Game(title:gameTitle!))
            print("\n")
            
            for game in gameArray {
                print(game.title)
            }
            print("\n")
        } else{
            print("That is not a valid password!")
        }
    }
    
    func removeGames(){
        
        print ("Please enter a password to remove a game.")
        var input: String? = nil
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input")
            }
        } while input == nil
        if input == "Gamer4Lyfe"{
            
            print("Please enter a game to remove:")
            for (i,index) in gameArray.enumerated(){
                print("\(i+1). \(index.title)")
            }
        
            if let removeTitle = Int(readLine()!){
                if removeTitle > 0 && removeTitle < gameArray.count{
                    gameArray.remove(at: removeTitle - 1)
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
        } else{
            print("That is not a valid password!")
        }
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
            if game.checkedIn == true {
                checkList = true
            }
        }
        if !checkList {
            return print("There are no games available to check out.")
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
                if !gameArray[input - 1].checkedIn{
                    return print("This game is checked out.")
                } else {
                    
                    gameArray[input - 1].checkedIn = false
                    let currentCalendar = Calendar.current
                    let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
                    gameArray[input - 1].dueDate = dueDate
                    if let dueDate = dueDate{
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MM/dd/yyyy"
                        print("your game is due back on \(dateFormatter.string(from: dueDate))")
                    }
                }
                
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
            }
        } else {
            print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
            checkGameOut()
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
                if gameArray[input - 1].checkedIn {
                    return print("This game is already found in the library.")
                } else {
                    gameArray[input - 1].checkedIn = true
                    gameArray[input - 1].dueDate = nil
                    print("These are available for check out:")
                    print("")
                    for game in gameArray{
                        if game.checkedIn == true {
                            print(game.title)
                        }
                    }
                }
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count) \n")
                checkGameIn()
            }
        } else {
            print("Invalid Input! Please enter in a number between 1 and \(gameArray.count) \n")
            checkGameIn()
        }
    }
}




