import Foundation

protocol Animal {
    var name: String {get}
    var age: Int {get}
    
    func toString() -> String
}

protocol BaseIterator {
    associatedtype T
    func next() -> T?
    func hasNext() -> Bool
    func reset()
}

