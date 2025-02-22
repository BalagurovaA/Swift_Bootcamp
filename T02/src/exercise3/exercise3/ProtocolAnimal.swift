import Foundation

protocol Animal {
    var name: String {get}
    var age: Int {get}
    
    func toString() -> String
}

protocol Herbivore {
    func chill() -> String
}

protocol Omnivore {
    func hunt() -> String
}
