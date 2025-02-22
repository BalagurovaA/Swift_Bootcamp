//вводи путь вместе с файлом!
// /Users/kristofs/Desktop/my projects/AP1_Sw_T01-1/src/exercise7/1.txt
import Foundation

func myMain() {
    let filePath = readFilePath()
    if(checkExistingFile(filePath: filePath) == true) {
        let readData = readingData(path: filePath)
        
        let quantity = readData.0
        let numArr = readData.1
        // вот сюда закинуть проверку на введенные данные
        let cort = findMinMax(numbArr: numArr)
        if (writeToFile(numbers: cort) == true && checkInput(quantity:quantity, numArr: numArr) == 0) {
            print(quantity)
            let stirngArr = numArr.map {String($0)}
            let resArr = stirngArr.joined(separator: " ")
            print(resArr)
            print("Saved min and max values in file")
        }
    } else {
        print("Input error. File isn't exist")
    }
}


func readFilePath() -> String {
    var path: String = ""
    if let input1 = readLine() {
         path = input1
    }
    return path
}

func checkExistingFile(filePath: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: filePath) ? true : false
}

func readingData(path: String) -> (Int, [Double]) {
    var resultQuantuty: Int = 0
    var resultArr: [Double] = []
    let lines = readLinesFromFile(myFilePath: path)
    resultQuantuty = findQuantityFromLines(lines: lines)
    resultArr = findNumbersFromLines(lines: lines, resQuan: resultQuantuty)
    return (resultQuantuty, resultArr)
}

//считываю из файла данные в типе подстрок (в линии)
func readLinesFromFile(myFilePath: String) -> Array<Substring> {
    var lines:Array<Substring> = []
    do {
        let contentsOfFile = try String(contentsOfFile: myFilePath, encoding: .utf8)
        lines = contentsOfFile.split(separator: "\n")
    } catch {
        print ("Can't read the file")
    }
    return lines
}

func checkInput(quantity: Int, numArr: [Double]) -> Int {
    var res = 0
    if (quantity <= 0) {
        print("Input error. Size <= 0")
        res = 1
    } else if(numArr.count != quantity) {
        print("Input error. Insufficient number of elements")
        res = 2 }
    return res
}

//считываю количество чисел из линии
func findQuantityFromLines(lines: Array<Substring>) -> Int {
    var resultQuantuty: Int = 0
    if let quantitySting = lines.first,
       let quantity = Int(quantitySting) {
        resultQuantuty = quantity
    }
    return resultQuantuty
}
//считываю числа из линии
func findNumbersFromLines(lines: Array<Substring>, resQuan: Int) -> [Double] {
    var resultArr: [Double] = []
    if lines.count > 1 {
        let numbersArrString = lines[1]
        let numbersArrSplitted = numbersArrString.split(separator: " ")
        var countOfNumbers = 0
        //надо сделать считывание только того кол ва чисел сколько указано в quantity
        for numbers in numbersArrSplitted {
            if countOfNumbers <= resQuan {
                if let numb = Double(numbers) {
                    resultArr.append(numb)
                    countOfNumbers += 1
                }
            }
        }
    }
    if(resultArr.count != resQuan) {
        resultArr = []
    }
    return resultArr
}

func findMinMax(numbArr: [Double]) -> (Double, Double) {
    var resMin = 0.0
    var resMax = 0.0
    if let myMin: Double = numbArr.min(),
       let myMax: Double = numbArr.max() {
        resMin = myMin
        resMax = myMax
    }
    return (resMin, resMax)
}

func tupleToString(tuple: (Double, Double)) -> String {
    return String(tuple.0) + " " + String(tuple.1)
}

func writeToFile(numbers: (Double, Double) ) -> Bool  {
    var res = false
    let numbStr = tupleToString(tuple: numbers)
    let filePath = "/Users/kristofs/Desktop/my projects/AP1_Sw_T01-1/src/exercise7/result.txt"
    do {
        let data = Data(numbStr.utf8)
        try data.write(to: URL(fileURLWithPath: filePath))
        res = true
    } catch {
        print("can't write to file")
    }
    return res
}
myMain()
