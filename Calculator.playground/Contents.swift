import UIKit

/* Create a calculator playground and break it into 3 sections.
The top section defines all your input variables
The middle section defines all the operations
The bottom section prints all the results to the screen
Have the calculator perform the following operations on your variables;
Add/Subtract/Multiply/Divide/Percentages*/

// Create variables to use for equations
var a = 616 // Marvel universe
var b = 42 // Answer to the ultimate question of life, the universe, and everything

// Show the variables
print("Variable 'a' equals: " + String(a))
print("Variable 'b' equals: " + String(b))

// Define the opperations

// Adding numbers
var addition = a + b
print("\nThe variables added together equal: " + String(addition))

// Subtracting numbers
var subtraction = a - b
print("\nThe variable 'a' subtracted by 'b' equals: " + String(subtraction))

// Multiplying numbers
var multiplication = a * b
print("\nThe variables multiplied together equal: " + String(multiplication))

// Dividing numbers
var division = a / b
print("\nThe variable 'a' divided by 'b' equals: " + String(division))

// Percentage of number
var percentage = String(format: "%.2f", ((Double(b) / Double(a)) * 100))

print("\nThe variable 'b' is " + percentage + "% of variable 'a'")
