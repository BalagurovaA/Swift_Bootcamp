import Foundation

struct Car {
    
    var carModel: String
    var quantityOfPassangers: Int
    var speed: Int
    
    init(carModel: String, quantityOfPassangers: Int, speed: Int) {
        self.carModel = carModel
        self.quantityOfPassangers = quantityOfPassangers
        self.speed = speed
    }

}
