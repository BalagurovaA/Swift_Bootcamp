import Foundation

func input() -> Int {
    var sec: Int = 0
    var validInput = false
    
    while !validInput {
        print("введи секунды")
        if let secInput = readLine(),
           let seconds = Int(secInput) {
            sec = seconds
            if (sec < 0) {
                print("Incorrect time")
            } else {
                validInput = true
            }
        } else {
            print("Couldn't parse a number. Please, try again")
        }
    }
    return sec
}

func time(inputSec: Int) -> [String: Int] {
    var sec = 0
    var min = 0
    var hour = 0
    var result: [String: Int] = [:]

    min = inputSec / 60
    hour = Int(min) / 60
    min -= hour * 60
    let minInSec = Int(inputSec / 60) * 60
    sec  = Int(inputSec - minInSec)

    result = ["hh": hour, "mm": min, "ss": sec ]
    return result
}

func output(finalTime:[String: Int]) {
    let formatOfTime = String(format: "%02d:%02d:%02d", finalTime["hh"]!, finalTime["mm"]!, finalTime["ss"]! )
    print(formatOfTime)
}

var sec = input()
output(finalTime: time(inputSec: sec))
