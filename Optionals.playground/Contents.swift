import UIKit

var str = "Optionals playground"

// Creating optionals
var itemGathered: String?
var expToNextLevel: Int?
var hpBonus: Int?

itemGathered = "thingy"
// Optional binding

if let item = itemGathered{
    
    print("you found a \(item)")
} else {
    print("Dat be empty")
}

// Forced unwrapping

itemGathered



