import Foundation

protocol Animal {
    var name: String {get}
    var age: Int {get}
    var weight: Double {get}

    func toString() -> String
    func getFeedIntoKg() -> Double
}
