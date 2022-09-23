import UIKit

func showTime() {
     // Create a loop that repeats every second
     Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
     timer in
         // Create variables for current time, hour, minute, and second
         var currentDateTime = Date()
         var hour = (Calendar.current.component(.hour, from: currentDateTime))
         var min = (Calendar.current.component(.minute, from: currentDateTime))
         var sec = (Calendar.current.component(.second, from: currentDateTime))
         // Print the current time
         print("\(hour):\(min):\(sec)")
     }
 }
// Run the clock
showTime()
