// Design a Playground that simulates a working clock that keeps track of hours minutes and seconds..

import UIKit
 
func showTime() {
     Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
     timer in
         var currentDateTime = Date()
         var hour = (Calendar.current.component(.hour, from: currentDateTime))
         var min = (Calendar.current.component(.minute, from: currentDateTime))
         var sec = (Calendar.current.component(.second, from: currentDateTime))
         print("\(hour):\(min):\(sec)")
     }
 }

showTime()

