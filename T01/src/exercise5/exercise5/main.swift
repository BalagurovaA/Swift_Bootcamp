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
            print("Couldn't parse a number. Please, try again")
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
            print("Couldn't parse a number. Please, try again")
        }
    }
    return arrNumbers
}

func stingMirror(str: String) -> Bool {
    var result = false
    let strFirst = str.first
    let strLast = str.last
    if(strFirst == strLast) {
        result = true
    }
    return result
}

func firstLastNumb(arrNumbers: [Int]) -> String {
    
    let stringArr = arrNumbers.map { String($0) }
    var tempStringArr: [String] = []
    var resultString: String = ""
    var i = 0
    while i < stringArr.count {
        if(stingMirror(str: stringArr[i]) == true) {
            tempStringArr.append(stringArr[i])
        }
    i += 1
    }
    if tempStringArr.isEmpty {
        print("There are no such elements")
        return resultString
    } else {
        resultString = tempStringArr.joined(separator: " ")
    }
    return resultString
}

print(firstLastNumb(arrNumbers:inputCollection(quantity: inputQuantity())))
