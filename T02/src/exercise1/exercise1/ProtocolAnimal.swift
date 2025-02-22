import Foundation

protocol Animal: CustomStringConvertible {
    var name: String { get }
    var age: Int { get }
}
