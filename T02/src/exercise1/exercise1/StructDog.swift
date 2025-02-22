import Foundation

struct Dog: Animal {
    var name: String
    var age: Int
    
    var description: String {
        "Dog name = \(name), age = \(age)"
    }
    
}
