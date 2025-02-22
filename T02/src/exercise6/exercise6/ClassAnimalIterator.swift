import Foundation

class AnimalIterator: BaseIterator {
    
    typealias T = Animal
    private var pets: [Animal] = []
    private var currIndex: Int = 0

    init(pets: [Animal], currIndex: Int) {
        self.pets = pets
        self.currIndex = currIndex
    }
    
    func next() -> Animal? {
        guard currIndex < pets.count else {
            return nil
        }
        let currAnimal = pets[currIndex]
        currIndex += 1
        return currAnimal
    }
    
    func hasNext() -> Bool {
        return currIndex < pets.count ? true : false
    }
    
    func reset() {
        currIndex = 0
    }
}
