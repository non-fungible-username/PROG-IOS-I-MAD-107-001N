/*Write the code to organize and extract some data from a collection of items you have at home.
 Use at least one dictionary and one array*/

import UIKit

// Create a dictionary with the game title as the key and game data as the pair
// Game data consists of number of players needed, minimum age, and if it has been played
let gameCollection =
    ["Apples to Apples":(players:(min:4, max:10), age:12, played:"yes"),
    "Ascension":(players:(min:2, max:4), age:14, played:"yes"),
    "Bad Medicine":(players:(min:3, max:8), age:16, played:"no"),
    "Betrayal at House on the Hill":(players:(min:3, max:6), age:12, played:"no"),
    "Bottom of the 9th":(players:(min:1, max:2), age:13, played:"yes"),
    "Cards Against Humanity":(players:(min:3, max:20), age:17, played:"yes"),
    "Catan":(players:(min:3, max:4), age:10, played:"no"),
    "Dominion":(players:(min:2, max:4), age:13, played:"yes"),
    "Elf":(players:(min:2, max:4), age:8, played:"yes"),
    "Loaded Questions":(players:(min:4, max:6), age:10, played:"yes"),
    "Off Topic":(players:(min:2, max:8), age:17, played:"no"),
    "Scattergories":(players:(min:2, max:6), age:12, played:"yes"),
    "Trivial Pursuit":(players:(min:2, max:6), age:16, played:"yes"),
    "Uno":(players:(min:2, max:10), age:7, played:"yes"),
    "WTF?":(players:(min:3, max:20), age:18, played:"no"),
    "Yahtzee":(players:(min:1, max:4), age:8, played:"yes")]
    as [String : (players:(min:Int, max:Int), age:Int, played:String)]

// Create a function to sort and display which games to play
// Function has parameters for number of players and the youngest player's age
func whichGamePlay(players: Int, youngest: Int) {
    var gamesToPlay = [String]() // creates an array to house the sorted games to play
    for (key, gameData) in gameCollection {
        if gameData.players.min <= players, gameData.players.max >= players { // filters to games within players range
            if gameData.age <= youngest { // filters to games the youngest player can play
                if gameData.played == "no" { // puts games not played yet at front of the list
                    gamesToPlay.insert(key, at:0)
                } else { // puts all other games at end of the list
                    gamesToPlay.append(key)
                }
            }
        }
    }
    // Format the display output
    print("Here are the games you can play with \(players) players ages \(youngest) and up.")
    print("Games you have not played yet will be listed first.")
    let wave = String(repeating: "-=", count: 31) // harder to do than I thought
    print(wave)
    var counter = 1
    // Print the games to play
    for item in gamesToPlay {
        print("\(counter). \(item)")
        counter += 1
    }
}
// Run the function
whichGamePlay(players: 4, youngest: 18)
 
