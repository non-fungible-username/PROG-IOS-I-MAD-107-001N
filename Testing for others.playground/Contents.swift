import UIKit
import Foundation


print("please just print this")

class DetermineMacros{
    var age:Int
    var gender:Int //man == 1 female == 2
    var heightFeet:Double
    var heightInches:Double
    var weight:Double
    var activityLevel:Double
    var goal:String //except only "gain" "loss" "remain"
    
    //internal class variables
    var REE:Double = 0
    var protein:Double = 0
    var fat:Double = 0
    var carbs:Double = 0
    //gets TDEE, 1 will be REE X 1.375, 2 will be REE X 1.55, 3 will be REE X 1.725]
    var ActivityMultiplier:Double{
        if activityLevel == 1{
            return 1.375
        } else if activityLevel == 2{
            return 1.55
        } else if activityLevel == 3{
            return 1.725
        } else{
            return 1.375 //if a invalid number is put in, then its automatically set to light workout
        }
    }


    init(age:Int, gender:Int, heightFeet:Double, heightInches:Double, weight:Double, activityLevel:Double, goal:String){
        self.age = age
        self.gender = gender
        self.heightFeet = heightFeet
        self.heightInches = heightFeet
        self.weight = weight
        self.activityLevel = activityLevel
        self.goal = goal  //goal will be a percentage value (calorie deficits)
    }
    
    

    //calculated variable (stored elsewhere due to using self.)
    var cmheight: Double {
        return (30.48 * self.heightFeet) + (2.54 * self.heightInches)
    }
    
    func calculateREE() -> Double{ //resting energy expenditure
        if self.gender == 1{ //male
            REE = 10 * self.weight + 6.25 * cmheight
            REE = REE - 5 * Double(self.age) + 5
            
        } else if self.gender == 2{ //female
            REE = 10 * self.weight + 6.25 * cmheight
            REE = self.REE - 5 * Double(self.age) - 161
    
        }
        return self.REE
    }
    
    func calculatedMacroCalorieGoal() -> Double{
        var TDEE:Double = self.REE * self.ActivityMultiplier
        if self.goal == "loss"{
            TDEE = TDEE - (TDEE * 0.20)
        } else if self.goal == "gain"{
            TDEE = TDEE + (TDEE * 0.20)
        }
        return TDEE
    }
    
    func proteinCalculator() -> Int{
        var protein = self.weight * 0.825
        return Int(protein)
    }
    
    

     
    
    
    
}



/*
 var x = DetermineMacros(age: 20, gender: 1, heightFeet: 5, heightInches: 8, weight: 150, activityLevel: 2, goal: "gain")

print("\(x.calculateREE()) REE")
print(x.ActivityMultiplier)
print("\(x.calculatedMacroCalorieGoal()) Calories")
print(x.proteinCalculator())
print("please just print this")
*/
var myMacs = DetermineMacros(age: 37, gender: 1, heightFeet: 6, heightInches: 0, weight: 235, activityLevel: 1, goal: "Loss")
print("\(myMacs.calculateREE())")
print(myMacs.ActivityMultiplier)
print("\(myMacs.calculatedMacroCalorieGoal()) Calories")
print(myMacs.proteinCalculator())
