import Foundation

protocol Animal {
    var name: String {get}
    var age: Int {get}
    
    func toString() -> String
    func goToWalk() async throws -> Double
}
