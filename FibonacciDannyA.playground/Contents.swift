// Write a function that calculates and displays all the Fibonacci numbers from 0 to 1000

import UIKit

// Create a function to print the sequence from 0 to 1000
func fibonacciSeries() {
    // Create variables for the first and second number
    var num1 = 0
    var num2 = 1

    // Create variable for adding other variables
    var fibNum = 0
    
    // Create a variable to count the order of the series
    var counter = 1
    
    // Display what we are doing
    print("This is the Fibonacci series from 0 to 1000")
    
    // While loop to calculate and print the series and stops when the next number is over 1000
    while num1 <= 1000 {
        print("\(counter). \(num1)")
        fibNum = num1 + num2
        num1 = num2
        num2 = fibNum
        counter += 1
    }
}

// Run the function
fibonacciSeries()
