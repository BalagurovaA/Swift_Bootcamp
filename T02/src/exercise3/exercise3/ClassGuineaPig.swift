import Foundation

class GuineaPig: Animal, Herbivore{
    var name: String
    var age: Int
    
    func toString() -> String {
        return "GuineaPig name = \(name), age = \(age). " + chill()
    }
    
    func chill() -> String {
        return "I can chill for 12 hours"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
