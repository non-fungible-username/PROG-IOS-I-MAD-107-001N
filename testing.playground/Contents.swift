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
