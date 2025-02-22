import Foundation

class Cat: Animal {
    var name: String
    var age: Int
    
    func toString() -> String {
        return "Cat name = \(name), age = \(age)"
    }
    
    func goToWalk() async throws -> Double {
        let walkTime: Double = Double(age) * 0.5
        try await Task.sleep(nanoseconds: UInt64(walkTime * 1_000_000_000))
        return walkTime
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
