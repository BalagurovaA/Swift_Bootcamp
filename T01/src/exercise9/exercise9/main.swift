import Foundation

//ввожу количество
func inputQuantity() -> Int {
    var quantity: Int = 0
    var validInput = false
    
    while !validInput {
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

//ввожу строки
func inputStrings(quantity: Int) -> [String] {
    var stringArr: [String] = []
    
    while(stringArr.count != quantity) {
        if let tempstr = readLine() {
            let myStr = String(tempstr)
            stringArr.append(myStr)
        }
        
    }
    return stringArr
}

//нахожу подстроку
func findSubString() -> String {
    var subStr: String = ""
    if let tempSubStr = readLine() {
        subStr = String(tempSubStr)
    }
    
    return subStr
}

//реализую contains для строки
func checkStr(string: String, subStr: String) -> Bool {
    var res = false
        if string.count < subStr.count {
            res = false
        }
        for i in 0..<(string.count - subStr.count + 1) {
            let start = string.index(string.startIndex, offsetBy: i)
            let end = string.index(start, offsetBy: subStr.count)
            let range = start..<end

            if string[range] == subStr {
               res = true
            }
        }
    return res
}

//проверяю есть ли совпадения
func check(strings: [String], subStr: String) -> [String] {
    var res: [String] = []
    for string in strings {
        if(checkStr(string: string, subStr: subStr) == true) {
                res.append(string)
        }
    }
    return res
}

func myMain() {
    let quantity = inputQuantity()
    let strArr: [String] = inputStrings(quantity: quantity)
    var subStr: String = ""
    if (strArr.count == quantity) {
        subStr = findSubString()
    }
    let resArr:[String] = check(strings:strArr, subStr: subStr)
    let stringRes = resArr.map { String($0) }
    let res = stringRes.joined(separator: ", ")
    print (res)
}

myMain()
