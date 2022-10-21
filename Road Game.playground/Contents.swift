// Road Game Playground
// Creat a program that plays the 'ABC' road game.
// Objectives:
// •Saves each session with a date/time stamp, who played, and all the words found.
// •Keeps a history of the top most used words (perhaps for each category as well).
// •User has the choice to start on the letter "A", a letter chosen by the user, or a random letter.
// •User can have the letter order shuffled into a random order.
// •User can select from different game modes, including: words must start with the letter, only signs, only license plates, etc.


import UIKit

// Global constants
struct Letters {
    static let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                           "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    static let max = 26
}

// Global variables
struct GameLedger {
    static var pastGames = [String:Any]() // to save each game instance
}

// Enum for each game mode
enum GameModes: String {
    case Normal = "Normal Mode"
    case Random = "Random Mode"
    case StartWLetter = "Starts with Letter Mode"
    case OnlySigns = "Only Signs Mode"
    case OnlyLicenses = "Only License Plates Mode"
}

/* In Beta
struct TopWords {
    let word: String
    let timesUsed: Int
    var topWordLog: [String:Int] = [:]
    
    func showTopWords() {
        var counter = 1
        for (item, instances) in topWordLog {
            print("\(counter). \(item) used \(instances) times")
            counter += 1
        }
    }
}
*/

// Struct to fill out game information for saving and referencing
struct GameInfo {
    let players: [String]
    let mode: GameModes
    var words: [(letter: String, word: String)]
}

// Class for the game
class ABCGame {
    var players: [String]
    
    // Set variables
    var gameMode: GameModes = .Normal // can be changed when starting a new game
    var timeStamp: String = "" // set when starting a new game
    var gameLetters = Letters.alphabet // fills in this game instance's letter array
    var gameWords:[(letter: String, word: String)] = [] // stores each word used for each letter in this game instance
    var wordIndex = 0 // helps count through gameLetters array
    var thisGame = GameInfo(players: ["None"], mode: .Normal, words: [(letter: "-empty-", word: "-empty-")]) // I'm sure this can be done smarter
    
    init(Players: [String]) {
        self.players = Players
    }
    
    // Sets the current time and formats as a legible string
    func currentTime() -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        return "\(dateString)"
    }
    
    // Begins a new game and asks for the desired game mode
    func startGame(Mode: GameModes) {
        gameMode = Mode
        timeStamp = currentTime()
        
        thisGame = GameInfo(players: players, mode: gameMode, words: gameWords) // creates info for this game instance
        
        GameLedger.pastGames[timeStamp] = thisGame // creates instance of this game in game ledger
        
        // Displays game mode selected
        switch gameMode {
        case .Normal:
            print("Starting a new game in Normal Mode")
        case .Random:
            gameLetters.shuffle() // randomizes letter order
            print("Starting a new game in Random Mode")
        case .StartWLetter:
            print("Starting a new game in which the word must start with the current letter")
        case .OnlySigns:
            print("Starting a new game in which only signs can be used")
        case .OnlyLicenses:
            print("Starting a new game in which only license plates can be used")
        }
        
        // Displays the first letter needed
        print("The first letter is \(gameLetters[wordIndex])\n")
    }
    
    // Saves current game to game ledger
    func saveGame() {
        thisGame.words = gameWords
        GameLedger.pastGames[timeStamp] = thisGame // uses the time made as the key, may change later
    }
    
    // Asks for a word to progress the game
    func enterWord(Enter_A_Word: String) {
        var counter = 1 // for printing results when game is complete
        
        // Checks if word entered meets requirements for each mode
        switch gameMode {
        case .Normal, .OnlySigns, .OnlyLicenses, .Random:
            // Needs the word entered to contain the letter
            if Enter_A_Word.range(of: gameLetters[wordIndex], options: .caseInsensitive) != nil {
                gameWords += [(letter: (gameLetters[wordIndex]), word: Enter_A_Word)] // saves word and letter pair
                wordIndex += 1 // helps progress to next letter needed
                print("You entered: \(Enter_A_Word)")
                
                // print results if all 26 letters have been used
                if myGame.gameWords.count == Letters.max {
                    print("\nHurray, you finished the game!")
                    print("Lets see your words")
                    print("''''''''''''''''''''''''''''''")
                    
                    // Shows all words picked for each letter
                    for (letter, word) in gameWords {
                        // For display setting
                        if counter < 10 {
                            print("0\(counter). \(letter) - \(word)")
                        } else {
                            print("\(counter). \(letter) - \(word)")
                        }
                        counter += 1
                    }
                } else { // Displays letter needed for next word
                    print("The next letter is \(gameLetters[wordIndex])")
                }
            } else { // Asks for a valid word
                print("\(Enter_A_Word) does not have the letter \(gameLetters[wordIndex])")
                print("Please enter a different word")
            }
        case .StartWLetter:
            // Needs the word entered to start with the letter
            if Enter_A_Word.uppercased().hasPrefix(gameLetters[wordIndex]) == true {
                gameWords += [(letter: (gameLetters[wordIndex]), word: Enter_A_Word)] // saves word and letter pair
                wordIndex += 1 // helps progress to next letter needed
                print("You entered: \(Enter_A_Word)")
                
                // print results if all 26 letters have been used
                if myGame.gameWords.count == Letters.max {
                    print("\nHurray, you finished the game!")
                    print("Lets see your words")
                    print("''''''''''''''''''''''''''''''") // will make cooler
                    
                    // Shows all words picked for each letter
                    for (letter, word) in gameWords {
                        // For display setting
                        if counter < 10 {
                            print("0\(counter). \(letter) - \(word)")
                        } else {
                            print("\(counter). \(letter) - \(word)")
                        }
                        counter += 1
                    }
                } else { // Displays letter needed for next word
                    print("The next letter is \(gameLetters[wordIndex])")
                }
            } else { // Asks for a valid word
                print("\(Enter_A_Word) does not start with the letter \(gameLetters[wordIndex])")
                print("Please enter a different word")
            }
        }
        print("") // display separator
        
    }
    
    // Sets all game variables back to beginging condition
    func resetGame(Players: [String]) {
        thisGame = GameInfo(players: Players, mode: .Normal, words: [(letter: "-empty-", word: "-empty-")])
        players = Players
        gameMode = .Normal
        timeStamp = ""
        gameLetters = Letters.alphabet
        gameWords = []
        wordIndex = 0
    }
}
 
var myGame = ABCGame(Players: ["Player 1", "Player 2"])

myGame.startGame(Mode: .Random)

/* Testing when all letters in alphabet are used
myGame.enterWord(Enter_A_Word: "a")
myGame.enterWord(Enter_A_Word: "b")
myGame.enterWord(Enter_A_Word: "c")
myGame.enterWord(Enter_A_Word: "d")
myGame.enterWord(Enter_A_Word: "e")
myGame.enterWord(Enter_A_Word: "f")
myGame.enterWord(Enter_A_Word: "g")
myGame.enterWord(Enter_A_Word: "h")
myGame.enterWord(Enter_A_Word: "i")
myGame.enterWord(Enter_A_Word: "j")
myGame.enterWord(Enter_A_Word: "k")
myGame.enterWord(Enter_A_Word: "l")
myGame.enterWord(Enter_A_Word: "m")
myGame.enterWord(Enter_A_Word: "n")
myGame.enterWord(Enter_A_Word: "o")
myGame.enterWord(Enter_A_Word: "p")
myGame.enterWord(Enter_A_Word: "q")
myGame.enterWord(Enter_A_Word: "r")
myGame.enterWord(Enter_A_Word: "s")
myGame.enterWord(Enter_A_Word: "t")
myGame.enterWord(Enter_A_Word: "u")
myGame.enterWord(Enter_A_Word: "v")
myGame.enterWord(Enter_A_Word: "w")
myGame.enterWord(Enter_A_Word: "x")
myGame.enterWord(Enter_A_Word: "y")
myGame.enterWord(Enter_A_Word: "z")
*/
