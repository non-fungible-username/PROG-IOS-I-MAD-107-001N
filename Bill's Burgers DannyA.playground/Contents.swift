// Using Enumerations, Structures, and Optionals
// Build a playground to prototype an interactive menu for my new gourmet burger bistro.

import UIKit

var burgerMenu = ["BillMac":9.99, "HillBilly":11.99, "BillBQ":12.49, "FriedBillony":10.49, "ImpossiBill":14.99] // dictionary to hold burger name paired to price

var fullOrder = [String]() // list for adding burgers to the order
var totalPrice = 0.00 // used to add up final price

enum Burgers: String { // enum for each burger to use as a type parameter and to help add final price with a switch statement
    case BillMac = "The Bill Mac"
    case HillBilly = "The Hill Billy"
    case BillBQ = "The BillBQ"
    case FriedBillony = "Fried Billony"
    case ImpossiBill = "ImpossiBill Burger"
}

// Create a struct to make orders
struct BurgerOrder {
    // var burgerName: Any? - didn't use
    
    // Create a function to show the menu
    func showMenu() {
        print("Bill's Burgers Menu")
        print("-----------------------")
        print("1. The Bill Mac - $9.99 - Two all beef patties, Bill sauce, lettuce, cheese, pickles, onions on a sesame seed bun.\n")
        print("2. The Hill Billy - $11.99 - Third pound patty, haystack onions, blue cheese, apple wood smoked bacon, lettuce, tomato, pickles on a brioche bun.\n")
        print("3. The BillBQ - $12.49 - Third pound patty, candied bacon, sweet BBQ, smokey BBQ, spicy BBQ, pickles, onions on a pretzel bun.\n")
        print("4. Fried Billony - $10.49 - Three slices of thick cut baloney fried in sweet BBQ, special sauce, sliced cheddar cheese, lettuce, tomato on a croissant bun.\n")
        print("5. ImpossiBill Burger - $14.99 - Featuring an Un-beef-leaf-a-Bill vegan patty, Incon-Cheese-a-Bill vegan cheese, on a Bun-conceive-a-Bill vegan bun, topped with lettuce, tomato, pickles, carrot strings, lemon grass and tumeric.\n")
        print("")
    }
    
    // Create a function to add burgers to the order
    func addBurger(Burger: Burgers) { // using the Burgers enum as a parameter
        var burgerRaw = Burger.rawValue // stores the chosen burger as the correct String
        var tempCost = 0.0 // helps add the costs
        print("Adding \(burgerRaw) to order")
        
        fullOrder.append(burgerRaw) // adds burger to the order
        
        switch Burger { // adds the correct cost for the burger ordered
        case .BillMac:
            tempCost = burgerMenu["BillMac"] ?? 0.00 // needed to declare the default for the optional
            print("Price: $\(tempCost)\n")
            totalPrice += tempCost
        case .HillBilly:
            tempCost = burgerMenu["HillBilly"] ?? 0.00 // needed to declare the default for the optional
            print("Price: $\(tempCost)\n")
            totalPrice += tempCost
        case .BillBQ:
            tempCost = burgerMenu["BillBQ"] ?? 0.00 // needed to declare the default for the optional
            print("Price: $\(tempCost)\n")
            totalPrice += tempCost
        case .FriedBillony:
            tempCost = burgerMenu["FriedBillony"] ?? 0.00 // needed to declare the default for the optional
            print("Price: $\(tempCost)\n")
            totalPrice += tempCost
        case .ImpossiBill:
            tempCost = burgerMenu["ImpossiBill"] ?? 0.00 // needed to declare the default for the optional
            print("Price: $\(tempCost)\n")
            totalPrice += tempCost
        }
    }
    
    // Create a fuction to show what was ordered and the final price
    func showOrder() {
        print("You odered:")
        var counter = 0 // for display use
        for item in fullOrder { // prints the ordred burgers
            counter += 1
            print("\(counter). \(item)")
        }
        var currentTotal = String(format: "%.2f", totalPrice)
        print("Your total comes to $\(currentTotal)\n")
    }
    
    // Create a function to reset the order list and price
    func clearTill() {
        fullOrder.removeAll()
        totalPrice = 0.00
    }
    
}

var myOrder = BurgerOrder()

myOrder.showMenu()

myOrder.addBurger(Burger: .BillMac)
myOrder.addBurger(Burger: .ImpossiBill)

myOrder.showOrder()

totalPrice
myOrder.clearTill()
totalPrice
