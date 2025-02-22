import Foundation

func mySequence() {
    var prevNumb: Int? = nil
    
    var boolCheck = true
    var count: Int = 0
    while boolCheck == true { //ввод числа
        if let input = readLine(),
           let number = Int(input) {
            count += 1
            if let previous = prevNumb {
                if previous >= number { //если не подходит число
                    print("The sequence is not ordered from the ordinal number of the number \(number)")
                    boolCheck = false
                }
            }
            //если подходит
            prevNumb = number
        } else {
            if count == 0 {
                print("Input error")
            } else {
                print("The sequence is ordered in ascending order")
            }
            boolCheck = false
        }
    }
}

mySequence()

