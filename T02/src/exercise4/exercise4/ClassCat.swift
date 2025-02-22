import Foundation

class Cat: Animal {
    var name: String
    var age: Int
    
    func toString() -> String {
        return "Dog name = \(name), age = \(age)"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
