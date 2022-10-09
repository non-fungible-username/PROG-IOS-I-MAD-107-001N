// Using Enumerations, Structures, and Optionals
// Build a playground to prototype an interactive menu for my new gourmet burger bistro.

import UIKit

var burgerMenu = ["BillMac":5.99, "HillBilly":6.99, "BillBQ":7.49, "FriedBillony":6.49, "ImpossiBill":7.99]

var fullOrder = [String]()
var totalPrice = 0.00

enum Burgers: String {
    case BillMac = "The Bill Mac"
    case HillBilly = "The Hill Billy"
    case BillBQ = "The BillBQ"
    case FriedBillony = "Fried Billony"
    case ImpossiBill = "ImpossiBill Burger"
}

struct BurgerOrder {
    var burgerName: String?
    
    func showMenu() {
        print("Bill's Burgers Menu")
        print("-----------------------")
        print("1. The Bill Mac")
        print("2. The Hill Billy")
        print("3. The BillBQ")
        print("4. Fried Billony")
        print("5. ImpossiBill Burger")
    }
    
    func addBurger(Burger: Burgers) {
        print("Add burger to order")
        if let thisBurger = burgerName {
            fullOrder.append(thisBurger) // add burger to fullOrder
            for (item, value) in burgerMenu {
                if thisBurger == item {
                    totalPrice += value
                }
            }
        } else {
            print("No item added")
        }
    }
    
    func showOrder() {
        print("You odered:")
        var counter = 0
        for item in fullOrder {
            counter += 1
            print("\(counter). \(item)")
        }
        var currentTotal = String(format: "%.2f", totalPrice)
        print("Your total comes to $\(currentTotal)")
    }
    
}

var myOrder = BurgerOrder()

myOrder.showMenu()
myOrder.showOrder()
myOrder.addBurger(Burger: HillBilly)

