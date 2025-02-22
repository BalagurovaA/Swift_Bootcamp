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


func inputData() -> (String, Int) {
    var carName: String = ""
    var quantity: Int = 0
    
    if let input1 = readLine() {
        carName = input1
    }
    if let input2 = readLine(),
       let tempQuantity = Int(input2) {
        quantity = tempQuantity
    }
    return (carName, quantity)
}


func checkTheSpeed(quantPass: Int)-> Int {
    var speed: Int = 0
switch quantPass {
case 1:
    speed = 110
case 1 ..< 6:
    speed = 90
case 6...:
    speed = 60
default:
    speed = 0
}
return speed
    
}

func writeInCar() {
    var arrRes: [Car] = []

    var car: Car = Car(carModel: "", quantityOfPassangers: 0, speed: 0)
    let quantity = inputQuantity()

    
    while arrRes.count != quantity {
        let data: (String, Int) = inputData()
        let speed = checkTheSpeed(quantPass: data.1)
        
        car = Car(carModel: data.0, quantityOfPassangers: data.1, speed: speed)
        arrRes.append(car)
    }
    
    
    var finalSpeed: [String] = []
    for car in arrRes {
        if car.speed == 0 {
            finalSpeed.append("Incorrect input. Passengers count <= 0")
        } else {
            finalSpeed.append(String(car.speed))
        }
    }
    let res = finalSpeed.joined(separator: ", ")
    print(res)
}

writeInCar()
