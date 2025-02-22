import Foundation

class Cat: Animal, Omnivore {

    var name: String
    var age: Int
    
    func toString() -> String {
        return "Cat name = \(name), age = \(age). " + hunt()
    }
    func hunt() -> String {
        return "I can hunt for mice"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
