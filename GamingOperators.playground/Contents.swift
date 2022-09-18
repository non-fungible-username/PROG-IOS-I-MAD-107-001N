/* Come up with a program idea that uses what you learned about operators creatively!
 This app will walk through combat rounds in a computerized table top game.*/

import UIKit

// Create constants needed
let player = "Hero"
let computer = "Enemy"
let actionOptions = "1. Attack - deals 4 damage to opponent\n2. Barrage - deals double damage, but deals normal damage to self\n3. Heal - heal self by half of current heath (max health cannot exceed 20)"
let makeChoice = "Enter the number of the action you want the \(player) to perform: "
let attackDmg = -4

// Create variables needed
var heroHealth = 20
var enemyHealth = 20
var playerChoice = 0 // initialize player selection var
var computerChoice = 0 // initialize computer selection var

// Create function to run user choice
func playerAction() {
    if (playerChoice == 1) {
        enemyHealth += attackDmg // deducts 4 from enemy health
        print("The \(player) chooses attack.")
        print("The \(player) attacks the \(computer) for 4 damage.\n")
    }
    else if (playerChoice == 2) {
        enemyHealth += (attackDmg * 2) // deducts 8 from enemy health
        heroHealth += attackDmg // deducts 4 from player health
        print("The \(player) chooses barrage.")
        print("The \(player) barrages the \(computer) for 8 damage. In the chaos, the \(player) take 4 damage.\n")
    }
    else if (playerChoice == 3) {
        heroHealth += (heroHealth / 2) // increases player health 50%
        if (heroHealth >= 20) {
            heroHealth = 20 // returns player health to 20 if exceeded
        }
        print("The \(player) chooses heal.")
        print("The \(player) heals to \(heroHealth).\n")
    }
    if (enemyHealth <= 0) {
        print("The \(player) is victorious!")
        healthStatus()
    }
}

func computerAction() {
    if (computerChoice == 1) {
        heroHealth += attackDmg // deducts 4 from player health
        print("The \(computer) chooses attack.")
        print("The \(computer) attacks the \(player) for 4 damage.\n")
    }
    else if (computerChoice == 2) {
        heroHealth += (attackDmg * 2) // deducts 8 from player health
        enemyHealth += attackDmg // deducts 4 from enemy health
        print("The \(computer) chooses barrage.")
        print("The \(computer) barrages the \(player) for 8 damage. In the chaos, the \(computer) take 4 damage.\n")
    }
    else if (computerChoice == 3) {
        enemyHealth += (enemyHealth / 2) // increases enemy health 50%
        if (enemyHealth >= 20) {
            enemyHealth = 20 // returns enemy health to 20 if exceeded
        }
        print("The \(computer) chooses heal.")
        print("The \(computer) heals to \(enemyHealth).\n")
    }
    if (heroHealth <= 0) {
        print("The \(computer) is victorious!")
        healthStatus()
    }
}

func healthStatus() {
    print("Hero health is: \(heroHealth)\n" + "Enemy health is: \(enemyHealth)\n\n")

}

// Start the combat round
print("Time to play 'Heroes and Enemies'")
print("Each turn, a character can choose one of the following actions:")
print(actionOptions)
print("The " + player + " may choose first.")
print(makeChoice)

// First round of combat
print("1\n")
playerChoice = 1
playerAction()

computerChoice = 2
computerAction()

healthStatus()

// Second round of combat
print("Next round")
print(makeChoice)
print("3\n")
playerChoice = 3
playerAction()

computerChoice = 1
computerAction()

healthStatus()

// Third round of combat
print("Next round")
print(makeChoice)
print("2\n")
playerChoice = 2
playerAction()

computerChoice = 3
computerAction()

healthStatus()

// Final round of combat
print("Next round")
print(makeChoice)
print("2\n")
playerChoice = 2
playerAction()
