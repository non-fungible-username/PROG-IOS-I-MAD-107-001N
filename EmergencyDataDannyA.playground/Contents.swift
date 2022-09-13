import UIKit

// Create contact info constants for each entry
let jimContact = "Jim Beam\n568 Happy Hollow Rd\nClermont, KY 40110\n502-215-2295"
let jackContact = "Jack Daniels\n182 Lynchburg Highway\nLynchburg, IL 37352\n931-759-6357 "
let johnnieContact = "Johnnie Walker\n145 Princes St\nEdinburgh EH2 4BL, United Kingdom\n0131-376-9494"

// Create user input variable
var userChoice = 0

// Display list options
let listOptions = "Emergency Contacts List\n1. Jim\n2. Jack\n3. Johnnie\nType 0 to end program\nPlease type the corresponding number of the contact you want to display: "

// Get user input
print(listOptions)
print("User inputs 1\n")
userChoice = 1

if userChoice == 1 {
    print(jimContact)
    print("")
    print("Make a new selection\n" + listOptions)
}
else if userChoice == 2 {
    print(jackContact)
    print("")
    print("Make a new selection\n" + listOptions)
}
else if userChoice == 3 {
    print(johnnieContact)
    print("")
    print("Make a new selection\n" + listOptions)
}

print("User inputs 2\n")
userChoice = 2

if userChoice == 1 {
    print(jimContact)
    print("")
    print("Make a new selection\n" + listOptions)
}
else if userChoice == 2 {
    print(jackContact)
    print("")
    print("Make a new selection\n" + listOptions)
}
else if userChoice == 3 {
    print(johnnieContact)
    print("")
    print("Make a new selection\n" + listOptions)
}

print("User inputs 3\n")
userChoice = 3

if userChoice == 1 {
    print(jimContact)
    print("")
    print("Make a new selection\n" + listOptions)
}
else if userChoice == 2 {
    print(jackContact)
    print("")
    print("Make a new selection\n" + listOptions)
}
else if userChoice == 3 {
    print(johnnieContact)
    print("")
    print("Make a new selection\n" + listOptions)
}
