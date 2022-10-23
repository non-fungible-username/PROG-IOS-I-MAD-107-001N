import UIKit

let date = Date()
let df = DateFormatter()
df.dateFormat = "yyyy-MM-dd HH:mm:ss"
let dateString = df.string(from: date)
print(dateString)

func currentTime() -> String {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    return "\(hour):\(minutes)"
}
print(currentTime())

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
 
 // Saves current game to game ledger
 func saveGame() {
     thisGame.words = gameWords
     GameLedger.pastGames[timeStamp] = thisGame // uses the time made as the key, may change later
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
 
*/
