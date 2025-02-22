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
           (anType == "dog" || anType == "cat" || anType == "hamster" || anType == "guinea") {
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

func writeInfo(_ quantity: Int) {
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
        case "hamster":
            let theHam = Hamster(name: name, age: age)
            pets.append(theHam)
        case "guinea":
            let theGui = GuineaPig(name: name, age: age)
            pets.append(theGui)
        default:
            print("Incorrect input. Unsupported pet type")
        }
    }
    
    for i in 0 ..< pets.count {
        if(pets[i].age > 0) {
            print(pets[i].toString())
        }
    }

}

writeInfo(inputQuantity())


