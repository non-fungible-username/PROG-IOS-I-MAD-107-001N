import UIKit

let getRoll = { (die: Int) -> (Int) in
    var dieRoll = Int.random(in: 1...die)
    return dieRoll
}

func rollDice(die: Int, rolls: Int) {
    print("You rolled a \(die)-sided die \(rolls) times.")
    var totalRoll = 0
    for _ in 0..<rolls {
        totalRoll += getRoll(die)
    }
    print("Your roll total is: \(totalRoll)")
}

rollDice(die: 20, rolls: 2)
