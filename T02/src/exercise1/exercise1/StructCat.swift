import Foundation

struct Cat: Animal {
    
    var name: String
    var age: Int
    
    var description: String {
        "Cat name = \(name), age = \(age)"
    }
}

