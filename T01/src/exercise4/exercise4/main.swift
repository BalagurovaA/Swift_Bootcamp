import Foundation

func inputQuantity() -> Int {
    var quantity: Int = 0
    var validInput = false
    
    while !validInput {
        print("ВВЕДИ КОЛИЧЕСТВО")
        if let input1 = readLine(),
           let quant = Int(input1) {
            if(quant > 0) {
                quantity = quant
                validInput = true
            } else {
                print("Input error. Size <= 0")
            }
        } else {
            print(" 1 Couldn't parse a number. Please, try again")
            return inputQuantity()
        }
    }
    return quantity
}

func inputCollection(quantity: Int) -> [Int] {
    var arrNumbers = [Int]()
    var validInput = false

    while !validInput {
        if let input2 = readLine() {
            let temp = input2.split(separator: " ")
            arrNumbers.removeAll()
            var validCount = 0
            var allValid = true

            for tempNum in temp {
                if let number = Int(tempNum) {
                    arrNumbers.append(number)
                    validCount += 1
                } else {
                    print("Couldn't parse a number. Please, try again")
                    allValid = false
                    break
                }
            }
            if allValid && validCount == quantity {
                validInput = true
            }
        } else {
            print("4 Couldn't parse a number. Please, try again")
        }
    }

    return arrNumbers
}


func module(array: [Int]) -> Int {
    var result = 0
    var flag = 0
    var q = 0
    for numb in 0 ..< array.count {
        if array[numb] < 0 {
            q += 1
            flag = 1
            result += array[numb]
        }
    }
    if flag == 0 {
        print("There are no negative elements")
    } else {
        result /= q
    }

    return result
}
print(module(array: inputCollection(quantity: inputQuantity())))

