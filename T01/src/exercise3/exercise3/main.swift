import Foundation

func input() -> Int {
    var n: Int = 0
    var validInput = false
    
    while !validInput {
        print("введи число")
        if let input = readLine(),
           let numbInput = Int(input) {
            n = numbInput
            if (n > 46) {
                print("Too large n")
            } else if(n < 0) {
                print("Too small n")
            } else {
                validInput = true
            }
        } else {
            print("Couldn't parse a number. Please, try again")
        }
    }
    print("введенное число: ", n)
    return n
}

func fibb(n: Int) -> Int {
    if (n == 0) {
        return 0
    } else if (n == 1) || (n == 2) {
        return 1
    } else {
        return fibb(n: n - 1) + fibb(n: n - 2)
    }
}

print(fibb(n: input()))
