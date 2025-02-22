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

func inputCollection(quantity: Int) -> [Double] {
    var arrNumbers = [Double]()
    var validInput = false

    while !validInput {
        if let input2 = readLine() {
            let temp = input2.split(separator: " ")
            arrNumbers.removeAll()
            var validCount = 0
            var allValid = true

            for tempNum in temp {
                if let number = Double(tempNum) {
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

func sortingCollection(arr: [Double]) -> String {
    var arrDouble : [Double] = arr
    var min = 0
    var resultString: String
    let stringArr: [String]
    for i in 0 ..< arrDouble.count - 1 {
        min = i
        for j in i + 1 ..< arrDouble.count {
            if (arrDouble[j] < arrDouble[min]) {
                min = j
            }
        }
        if (min != i) {
            arrDouble.swapAt(i, min)
        }
    }
    stringArr = arrDouble.map { String($0) }
    resultString = stringArr.joined(separator: " ")
    return resultString
}

var one = inputCollection(quantity: inputQuantity())
print(sortingCollection(arr: one))

