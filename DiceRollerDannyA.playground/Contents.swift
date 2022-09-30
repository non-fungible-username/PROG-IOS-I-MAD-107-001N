import UIKit

let getRoll = { (die: Int) -> (Int) in
    var dieRoll = Int.random(in: 1...die)
    return dieRoll
}

func rollDice(die: Int, rolls: Int) {
    if rolls > 1 {
        print("You rolled a \(die)-sided die \(rolls) times.")
        var totalRoll = 0
        var eachRoll = [Int]()
        for _ in 0..<rolls {
            let thisRoll = getRoll(die)
            eachRoll.append(thisRoll)
            totalRoll += thisRoll
        }
        
        print("Your rolls are: ", terminator: "")
        for roll in eachRoll {
            print("\(roll)", terminator: " ")
        }
        print("\nYour roll total is: \(totalRoll)")
    }
    else {
        print("You rolled a \(die)-sided die.")
        print("Your roll total is: \(getRoll(die))")
    }
}
rollDice(die: 6, rolls: 4)
