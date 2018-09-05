//
//  Game.swift
//  Video Game Library
//
//  Created by Jamie Cummings on 9/4/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation

// this is the data modle that represents our Games that will be stored in the library.
class Game {
    var title: String
    var checkedIn = true
    // set this to true by default, since whenever we create a new Game, we're going to assume it's checked in
    var dueDate: Date?
    // this is opt bc if the game isn't checked out is shouldn't have a due date
    
    init(title:String) {
        self.title = title
        //since checkedin has a default value and duedate is an optional, the only balue that we have to initialize is the title
        
    }
}
