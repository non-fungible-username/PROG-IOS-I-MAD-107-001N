/* Create a dictionary of team members using their number as the key value
 Create as many other arrays as needed to store the rest of the info
 Using control flow statements do the following;
 Create a list of players sorted by age
 Create a list of players sorted by country
 Calculate the average age of the players
 Calculate the average height of the players
 Determine the month in which most of the players birthday falls */

import UIKit

// Create dictionary of team numbers associated to team member name and stats
let teamMembers = ["89":(name:"Andreas Athanasiou", country:"CAN", age:28, birthmonth:"AUG", height:74), "26":(name:"Evan Barratt", country:"USA", age:23, birthmonth:"FEB", height:72), "43":(name:"Colin Blackwell", country:"USA", age:29, birthmonth:"MAR", height:69), "28":(name:"Colton Dach", country:"CAN", age:19, birthmonth:"JAN", height:76), "13":(name:"Max Domi", country:"CAN", age:29, birthmonth:"MAR", height:70), "58":(name:"MacKenzie Entwistle", country:"CAN", age:23, birthmonth:"JUL", height:75), "70":(name:"Cole Guttman", country:"CAN", age:23, birthmonth:"APR", height:69), "86":(name:"Mike Hardman", country:"USA", age:23, birthmonth:"FEB", height:74), "52":(name:"Reese Johnson", country:"CAN", age:24, birthmonth:"JUL", height:73), "90":(name:"Tyler Johnson", country:"USA", age:32, birthmonth:"JUL", height:68), "88":(name:"Patrick Kane", country:"USA", age:33, birthmonth:"NOV", height:70), "14":(name:"Boris Katchouk", country:"CAN", age:24, birthmonth:"JUN", height:74), "16":(name:"Jujhar Khaira", country:"CAN", age:28, birthmonth:"AUG", height:76), "23":(name:"Philipp Kurashev", country:"CHE", age:22, birthmonth:"OCT", height:72), "24":(name:"Sam Lafferty", country:"USA", age:27, birthmonth:"MAR", height:73), "25":(name:"Jalen Luypen", country:"CAN", age:20, birthmonth:"JUN", height:70), "39":(name:"Luke Philp", country:"CAN", age:26, birthmonth:"NOV", height:70), "59":(name:"Jakub Pour", country:"CZE", age:23, birthmonth:"APR", height:75), "11":(name:"Taylor Raddysh", country:"CAN", age:24, birthmonth:"FEB", height:75), "27":(name:"Lukas Reichel", country:"DEU", age:20, birthmonth:"MAY", height:72), "53":(name:"Buddy Robinson", country:"USA", age:30, birthmonth:"SEP", height:78), "62":(name:"Brett Seney", country:"CAN", age:26, birthmonth:"FEB", height:69), "79":(name:"Dylan Sikura", country:"CAN", age:27, birthmonth:"JUN", height:71), "36":(name:"Josiah Slavin", country:"USA", age:23, birthmonth:"DEC", height:75), "71":(name:"Michal Teply", country:"CZE", age:21, birthmonth:"MAY", height:75), "19":(name:"Jonathan Toews", country:"CAN", age:34, birthmonth:"APR", height:74), "42":(name:"Nolan Allan", country:"CAN", age:19, birthmonth:"APR", height:74), "92":(name:"Nicolas Beaudin", country:"CAN", age:22, birthmonth:"OCT", height:71), "46":(name:"Louis Crevier", country:"CAN", age:21, birthmonth:"MAY", height:72), "38":(name:"Ethan Del Mastro", country:"CAN", age:19, birthmonth:"JAN", height:76), "76":(name:"Jakub Galvas", country:"CZE", age:23, birthmonth:"JUN", height:71), "8":(name:"Jack Johnson", country:"USA", age:35, birthmonth:"JAN", height:73), "82":(name:"Caleb Jones", country:"USA", age:25, birthmonth:"JUN", height:73), "4":(name:"Seth Jones", country:"USA", age:27, birthmonth:"OCT", height:76), "55":(name:"Kevin Korchinski", country:"CAN", age:18, birthmonth:"JUN", height:73), "6":(name:"Jake McCabe", country:"USA", age:28, birthmonth:"OCT", height:73), "51":(name:"Ian Mitchell", country:"CAN", age:23, birthmonth:"JAN", height:71), "5":(name:"Connor Murphy", country:"USA", age:29, birthmonth:"MAR", height:76), "41":(name:"Isaak Phillips", country:"CAN", age:20, birthmonth:"SEP", height:76), "75":(name:"Alec Regula", country:"USA", age:22, birthmonth:"AUG", height:76), "61":(name:"Riley Stillman", country:"CAN", age:24, birthmonth:"MAR", height:73), "72":(name:"Alex Vlasic", country:"USA", age:21, birthmonth:"JUN", height:78), "34":(name:"Petr Mrazek", country:"CZE", age:30, birthmonth:"FEB", height:74), "40":(name:"Arvid Soderblom", country:"SWE", age:23, birthmonth:"AUG", height:71), "32":(name:"Alex Stalock", country:"USA", age:35, birthmonth:"JUL", height:71), "30":(name:"Jaxson Stauber", country:"USA", age:23, birthmonth:"APR", height:75)] // as [String : Any]

// Create a variable to sort through the information
var teamValues = teamMembers.values

// Create a function that prints a list of players in order of age, youngest to oldest
func showPlayerSortedAge() {
    // Create a dictionary with the players sorted by age, youngest to oldest
    let playersSortedAge = teamValues.sorted(by: {$0.age < $1.age})
    // Print the list
    print("Here are the players from youngest to oldest:")
    for player in playersSortedAge {
        print("- \(player.name) is age \(player.age)")
    }
    print("")
}
showPlayerSortedAge()

// Create a function that prints a list of players sorted by home country alphabetically
func showPlayerCountry() {
    // Create a dictionary with the players sorted by country
    let playersSortedCountry = teamValues.sorted(by: {$0.country < $1.country})
    // Print the list
    print("The players are from the following countries:")
    for player in playersSortedCountry {
        print("- \(player.name) is from \(player.country)")
    }
    print("")
}
showPlayerCountry()

// Create a function that prints the average age of the players
func showAvgPlayerAge() {
    let playerAvgAge = teamValues // create a dictionary of the values
    var counter = 0 // to count total players
    var playerAges = 0 // to add all the player ages together
    
    // Counts the players and adds the ages together
    for player in playerAvgAge {
        counter += 1
        playerAges += player.age
    }
    let avgPlayerAge = playerAges / counter // gets the average age
    print("The average player age is \(avgPlayerAge).")
    print("")
}
showAvgPlayerAge()

// Create a function that prints the average height of the players
func showAvgPlayerHeight() {
    let playerAvgHeight = teamValues // create a dictionary of the values
    var counter = 0 // to count total players
    var playerHeights = 0 // to add all the player heights together
    
    // Counts the players and adds the heights together
    for player in playerAvgHeight {
        counter += 1
        playerHeights += player.height
    }
    let avgPlayerHeight = playerHeights / counter // gets the average height
    print("The average player height is \(avgPlayerHeight) inches.")
    print("")
}
showAvgPlayerHeight()

// Create a function that prints the month in which most of the players birthdays fall
func showMonthMostPlayersBorn() {
    let mostCommonBirthMonth = teamValues // create a dictionary of the values
    var playerBirthMonths = [String]() // create an array for the birth months
    
    // Adds all the player birth months to an array
    for player in mostCommonBirthMonth {
        playerBirthMonths.append(player.birthmonth)
    }
    
    var monthCounts:[String:Int] = [:] // dictionary for birth months
    
    // Fills the monthCounts dictionary with a key for each month paired with how many times it's a player birth month
    for item in playerBirthMonths {
        monthCounts[item] = (monthCounts[item] ?? 0) + 1
    }
   
    var currentMaxMonthCount = 0 // initialize a variable for the highest count of player birthdays in a month
    var currentMaxMonth = "" // initialize a variable to hold the month with the most player birthdays
    
    // Find the month with the most players born
    for (month, playersBorn) in monthCounts {
            if playersBorn > currentMaxMonthCount {
            currentMaxMonthCount = playersBorn
            currentMaxMonth = month
        }
    }
    // Converts the month abbreviation to the correct spelling. Easier that going back and changing them in the dictionary.
    switch currentMaxMonth {
        case "JAN":
            currentMaxMonth = "January"
        case "FEB":
            currentMaxMonth = "February"
        case "MAR":
            currentMaxMonth = "March"
        case "APR":
            currentMaxMonth = "April"
        case "MAY":
            currentMaxMonth = "May"
        case "JUN":
            currentMaxMonth = "June"
        case "JUL":
            currentMaxMonth = "July"
        case "AUG":
            currentMaxMonth = "August"
        case "SEP":
            currentMaxMonth = "September"
        case "OCT":
            currentMaxMonth = "October"
        case "NOV":
            currentMaxMonth = "November"
        case "DEC":
            currentMaxMonth = "December"
        default:
            print("Unknown month")
    }
    print("\(currentMaxMonth) is the month in which most of the players birthdays fall.")
    print("")
}
showMonthMostPlayersBorn()

