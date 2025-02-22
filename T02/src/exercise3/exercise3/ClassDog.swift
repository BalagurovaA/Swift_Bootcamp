import Foundation

class Dog: Animal, Omnivore {

    var name: String
    var age: Int
    
    func toString() ->String {
        return "Dog name = \(name), age = \(age). " + hunt()
    }
    
    func hunt() -> String {
        return "I can hunt for robbers"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
