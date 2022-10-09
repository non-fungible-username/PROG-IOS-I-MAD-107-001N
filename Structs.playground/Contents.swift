//: Playground - noun: a place where people can play

import UIKit

var str = "Structure Example"


// You can use structures to define custom types in Swift

struct Rectangle {
    var x:Int = 25
    var y:Int = 31
    var width:Int = 99
    var height:Int = 111
    
}

// This is how you instantiate a structure

var Billsrect = Rectangle()


// To access structure properties, you use dot syntax

print("x: \(Billsrect.x), y: \(Billsrect.y), width: \(Billsrect.width), height: \(Billsrect.height)")

// Structures can ...

//Define properties to store values
//Define methods to provide functionality
//Define subscripts to provide access to their values using subscript syntax
//Define initializers to set up their initial state
//Be extended to expand their functionality beyond a default implementation
//Conform to protocols to provide standard functionality of a certain kind

