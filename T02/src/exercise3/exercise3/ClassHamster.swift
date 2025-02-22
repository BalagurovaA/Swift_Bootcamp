import Foundation

class Hamster: Animal, Herbivore{
    var name: String
    var age: Int
    
    func toString() -> String {
        return "Hamster name = \(name), age = \(age). " + chill()
    }
    
    func chill() -> String {
        return "I can chill for 8 hours"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
