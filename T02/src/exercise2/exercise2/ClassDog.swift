import Foundation

class Dog: Animal {
    var name: String
    var age: Int
    var weight: Double
    
    func toString() -> String {
        let feed = getFeedIntoKg()
        return "Dog name = \(name), age = \(age), mass = \(weight), feed = \(feed)"
    }
    
    func getFeedIntoKg() -> Double {
        return Double(String(format: "%.2f", weight * 0.3)) ?? 0.0
    }
    
    init(name: String, age: Int, weight: Double) {
        self.name = name
        self.age = age
        self.weight = weight
    }
}
