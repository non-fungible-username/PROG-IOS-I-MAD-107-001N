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

struct Instructions {
    static func show() {
        print("------------")
        print("How to Start")
        print("------------")
        print("Use the .startGame method to select a game mode, then you can")
        print("choose a starting letter.\n")
        print("If you would like to shuffle the letters into a random order,")
        print("choose .on, otherwise choose .off\n\n")
        
        print("-----------")
        print("How to Play")
        print("-----------")
        print("Find all 26 letters of the alphabet on things that you pass as you")
        print("are going down the road, in alphabetical order.\n")
        print("Use the .enterWord method to add in each word, the game will then")
        print("show you the next letter to find.\n")
        print("After all 26 letters are found, the game ends and your final")
        print("results will display.\n\n")
        
        print("----------")
        print("Game Modes")
        print("----------")
        print("Normal: The word must contain the current round's letter")
        print("Starts With Letter: The word must start with current round's letter")
        print("Only Signs: Can only use letters found on signs")
        print("Only License Plates: Can only use letters found on license plates\n\n")
        
        print("-------")
        print("Options")
        print("-------")
        print(".saveGame: Saves a copy of the current game stats to the ledger")
        print(".resetGame: Resets all game stats. Must use .startGame after\n\n")
    }
}

// Global variables
struct GameLedger {
    static var pastGames = [String:Any]() // to save each game instance
}

// Enum for each game mode
enum GameModes: String {
    case Normal = "Normal Mode"
    case StartWLetter = "Starts with Letter Mode"
    case OnlySigns = "Only Signs Mode"
    case OnlyLicenses = "Only License Plates Mode"
}

// Enum for checking status of "random" selection
enum ToggleSwitch: String {
    case on = "on"
    case off = "off"
}

// Enum for the players to pick the starting letter
enum LetterChoices: String {
    case A = "A", B = "B", C = "C", D = "D", E = "E", F = "F", G = "G", H = "H", I = "I", J = "J", K = "K", L = "L", M = "M", N = "N", O = "O", P = "P", Q = "Q", R = "R", S = "S", T = "T", U = "U", V = "V", W = "W", X = "X", Y = "Y", Z = "Z"
}

// Struct to fill out game information for saving and referencing
struct GameInfo {
    let players: [String]
    let mode: GameModes
    let randomized: ToggleSwitch
    let firstLetter: LetterChoices
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
    var randomMode = ToggleSwitch.off // set when starting a new game
    var letterCounter = 0 // helps reorder letters when user chooses a starting letter
    var startingLetter: LetterChoices = .A // set when starting a new game
    var thisGame = GameInfo(players: ["None"], mode: .Normal, randomized: .off, firstLetter: .A, words: [(letter: "-empty-", word: "-empty-")]) // I'm sure this can be done smarter
    
    // Only asks for input of player names and displays the instructions on creation
    init(Player_Names: [String]) {
        self.players = Player_Names
        print("      *** LET'S PLAY THE ALPHABET ROAD GAME ***\n")
        print("(to learn how to play, use the .instructions() method)\n\n")
    }
    
    // Sets the current time and formats as a legible string
    func currentTime() -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        return "\(dateString)"
    }
    
    // Displays instructions for how to start and play a game
    func instructions() {
        Instructions.show()
    }
    
    // Begins a new game by setting desired game mode, starting letter, and randomize on or off
    func startGame(Mode: GameModes, Starting_Letter: LetterChoices, Randomize: ToggleSwitch) {
        gameMode = Mode
        randomMode = Randomize
        startingLetter = Starting_Letter
        
        // Set variables for the Game Ledger and make initial save
        timeStamp = currentTime()
        thisGame = GameInfo(players: players, mode: gameMode, randomized: randomMode, firstLetter: startingLetter, words: gameWords) // creates info for this game instance
        GameLedger.pastGames[timeStamp] = thisGame // creates instance of this game in game ledger
        
        // Displays game mode selected
        switch gameMode {
        case .Normal:
            print("Starting a new game in Normal Mode")
        case .StartWLetter:
            print("Starting a new game in which the word must start with the current letter")
        case .OnlySigns:
            print("Starting a new game in which only signs can be used")
        case .OnlyLicenses:
            print("Starting a new game in which only license plates can be used")
        }

        // Displays message if randomize is set to on and randomizes letter order
        if randomMode == .on {
            gameLetters.shuffle()
            print("The letter order has been randomized")
        }
        
        // Changes the starting letter chosen by user
        for letter in gameLetters {
            if letter == startingLetter.rawValue {
                wordIndex = letterCounter
            }
            letterCounter += 1
        }

        // Displays the first letter needed
        print("The first letter is \(gameLetters[wordIndex])\n")
    }
    
    // Saves current game to game ledger
    func saveGame() {
        thisGame.words = gameWords
        GameLedger.pastGames[timeStamp] = thisGame // uses the time made as the key, may change later
    }
    
    // Sets all game variables back to beginging condition
    func resetGame(Players: [String]) {
        gameMode = .Normal
        timeStamp = ""
        gameLetters = Letters.alphabet
        gameWords = []
        wordIndex = 0
        randomMode = ToggleSwitch.off
        letterCounter = 0
        startingLetter = LetterChoices.A
        thisGame = GameInfo(players: players, mode: gameMode, randomized: randomMode, firstLetter: startingLetter, words: gameWords)
        players = Players
    }
    
    // Used within enterWord func to trigger the end of a game when 26th letter has been used
    func endGame() {
        var counter = 1 // for printing results when game is complete
        
        if self.gameWords.count == Letters.max {
            saveGame() // makes a final copy for the game ledger
            
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
    }
    
    // Asks for a word to progress the game
    func enterWord(Enter_A_Word: String) {
        // Checks if word entered meets requirements for each mode
        switch gameMode {
        case .Normal, .OnlySigns, .OnlyLicenses:
            // Needs the word entered to contain the letter
            if Enter_A_Word.range(of: gameLetters[wordIndex], options: .caseInsensitive) != nil {
                gameWords += [(letter: (gameLetters[wordIndex]), word: Enter_A_Word)] // saves word and letter pair
                wordIndex += 1 // helps progress to next letter needed
                
                // Corrects the letter selction if starting letter was changed
                if wordIndex == Letters.max {
                    wordIndex -= Letters.max
                }
                
                print("You entered: \(Enter_A_Word)")
                
                // print results if all 26 letters have been used
                endGame()
                
            } else { // Asks for a valid word
                print("\(Enter_A_Word) does not have the letter \(gameLetters[wordIndex])")
                print("Please enter a different word")
            }
        case .StartWLetter:
            // Needs the word entered to start with the letter
            if Enter_A_Word.uppercased().hasPrefix(gameLetters[wordIndex]) == true {
                gameWords += [(letter: (gameLetters[wordIndex]), word: Enter_A_Word)] // saves word and letter pair
                wordIndex += 1 // helps progress to next letter needed
                
                // Corrects the letter selction if starting letter was changed
                if wordIndex == Letters.max {
                    wordIndex -= Letters.max
                }
                
                print("You entered: \(Enter_A_Word)")
                
                // print results if all 26 letters have been used
                endGame()
                
            } else { // Asks for a valid word
                print("\(Enter_A_Word) does not start with the letter \(gameLetters[wordIndex])")
                print("Please enter a different word")
            }
        }
        print("") // display separator
    }
}
 
var myGame = ABCGame(Player_Names: ["Player 1", "Player 2"])
myGame.instructions()

// myGame.startGame(Mode: .Normal, Starting_Letter: .E, Randomize: .on)

// myGame.startGame(Mode: .StartWLetter)

/* Testing when all letters in alphabet are used

myGame.enterWord(Enter_A_Word: "A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z")

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
