import Foundation

func inputQuantity() -> Int {
    print("enter QUANTITY: ")
    while true {
        if let input = readLine(),
           let quantity = Int(input){
            return quantity
        } else {
            print("Couldn't parse a number. Please, try again")
        }
    }
}

func inputType() -> String {
    print("enter PET'S TYPE: ")
        if let anType = readLine(),
           (anType == "dog" || anType == "cat") {
                return String(anType)
        }
    return ""
}

func inputName() -> String {
    print("enter PET'S NAME: ")
    while true {
        if let anName = readLine() {
            return String(anName)
        }
    }
}

func inputAge() -> Int? {
    print("enter PET'S AGE: ")
    if let anAge = readLine(),
       let age = Int(anAge),
       age > 0 {
        return age
    } else {
        print("Incorrect input. Age <= 0")
        return nil
    }
}

func writeInfo(_ quantity : Int) {
    var pets: [Animal] = []
    for _ in 0 ..< quantity {
        let type = inputType()
        if(type.isEmpty) {
            print("Incorrect input. Unsupported pet type")
            continue
        }
        
        let name = inputName()
        guard let age = inputAge() else {continue}
    
        switch type {
        case "dog":
            let theDog = Dog(name: name, age: age)
            pets.append(theDog)
        case "cat":
            let theCat = Cat(name: name, age: age)
            pets.append(theCat)
        default:
            print("Incorrect input. Unsupported pet type")
        }
    }
    let iterator = AnimalIterator(pets: pets, currIndex: 0)
    for _ in pets {
        if let pet = iterator.next() {
            print(pet.toString())
        }
    }
}

writeInfo(inputQuantity())
