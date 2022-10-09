// Using Enumerations, Structures, and Optionals
// Build a playground to prototype an interactive menu for my new gourmet burger bistro.

import UIKit

var burgerMenu = ["BillMac":5.99, "HillBilly":6.99, "BillBQ":7.49, "FriedBillony":6.49, "ImpossiBill":7.99]

enum Burgers {
    case BillMac
    case HillBilly
    case BillBQ
    case FriedBillony
    case ImpossiBill
}

struct BurgerOrder {
    var burgerName: String?
    var fullOrder: [String]?
    var totalPrice: Double?
    
    func showMenu() {
        print("Bill's Burgers Menu")
        print("-----------------------")
        print("1. The Bill Mac")
        print("2. The Hill Billy")
        print("3. The BillBQ")
        print("4. Fried Billony")
        print("5. ImpossiBill Burger")
    }
    
    func addBurger() {
        print("Add burger to order")
        if let thisBurger = burgerName {
            fullOrder.insert(thisBurger) // add burger to fullOrder
            for (item, value) in burgerMenu {
                if thisBurger == burgerMenu[item] {
                    if let burgerCost = value {
                        totalPrice += value
                    }
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
        print("Your total comes to $\(totalPrice ?? 0.00)")
    }
    
}

var myOrder = BurgerOrder()



