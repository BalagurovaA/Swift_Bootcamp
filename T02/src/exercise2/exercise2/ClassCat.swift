import Foundation

class Cat: Animal {
    var name: String
    var age: Int
    var weight: Double
    
    func toString() -> String {
        let feed = getFeedIntoKg()
        return "Cat name = \(name), age = \(age), mass = \(weight), feed = \(feed)"
    }
    
    func getFeedIntoKg() -> Double {
        return weight * 0.1
    }
    
    init(name: String, age: Int, weight: Double) {
        self.name = name
        self.age = age
        self.weight = weight
    }
}
