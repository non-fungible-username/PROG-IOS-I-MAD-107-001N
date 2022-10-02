import UIKit

// Create a closure to roll a die based on number of sides
let getRoll = { (die: Int) -> (Int) in
    let dieRoll = Int.random(in: 1...die)
    return dieRoll
}

// Create a closure to add and display final results
let displayFinalTotal = { (addedRolls: Int, modNum: Int) in
    if addedRolls != 1 && modNum != 0 { // only displays when multiple rolls and has modifier
        print("\nYour roll total is: \(addedRolls)") // dispaly total of rolls
    } else if addedRolls == 1 && modNum < 0 {
        print("\nYour roll total is: \(addedRolls)") // dispaly total of rolls
    }
    if modNum != 0 { // only displays if ther is a modifier
        print("\nYour modifier is: \(modNum)") // display bonus
    }
    
    let addTotal = addedRolls + modNum // create variable to hold final total
    print("\nYour final total is: \(addTotal)") // always display final total
    return
}

func rollDice(dieSides: Int, rolls: Int, modifier: Int) {
    // Create guard statment to prevent die sides and rolls of less than 1
    guard
        dieSides >= 2, // dies need to have 2 or more sides
        rolls >= 1 // must be rolled at least once
    else
        {
        // Instruct on the necessary parameters
        print("To use this function, the die must have 2 or more sides, and must be rolled 1 or more times. Try again.")
        return
        }
    
    if rolls > 1 { // handles multiple rolls with proper display
        print("You rolled a \(dieSides)-sided die \(rolls) times.") // display what user did
        var totalRoll = 0 // to add up rolls
        var eachRoll = [Int]() // array used to record each roll
        for _ in 0..<rolls { // record each roll in array and add up rolls
            let thisRoll = getRoll(dieSides)
            eachRoll.append(thisRoll)
            totalRoll += thisRoll
        }
        
        // Display each roll
        print("Your rolls are: ", terminator: "")
        for roll in eachRoll {
            print("|\(roll)|", terminator: " ")
        }
        print("")
        
        // Display results
        displayFinalTotal(totalRoll, modifier) // display final total
        
    } else { // only runs when roll is equal to one
        let totalRoll = getRoll(dieSides) // get roll result
        
        print("You rolled a \(dieSides)-sided die.") // display what user did
        
        // Display results
        displayFinalTotal(totalRoll, modifier) // display final total
    }
}

// Run the funcion
rollDice(dieSides: 20, rolls: 10, modifier: 9)
