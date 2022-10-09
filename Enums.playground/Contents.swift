

import UIKit

var str = "Enumerations"

//An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

// Some compas points

enum CompassPoint {
    case North
    case South
    case East
    case West
}

// Some planets on a single line

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

// Each enumeration definition defines a brand new type.

var directionToHead = CompassPoint.North

// The type of directionToHead is inferred when it is initialized with one of the possible values of CompassPoint

directionToHead = .East


// An Enumeration use example

directionToHead = .East
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}
