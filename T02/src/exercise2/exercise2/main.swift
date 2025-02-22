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
    var name = ""
    print("enter PET'S NAME: ")
    while true {
        if let anName = readLine() {
        name = String(anName)
        return name
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


func inputMass() -> Double? {
    print("enter PET'S WEIGHT: ")
    if let anMass = readLine(),
       let mass = Double(anMass),
       mass > 0 {
        return mass
    } else {
        print("Incorrect input. Mass <= 0")
        return nil
    }
}


func writeInfo(_ quantity: Int) {
    var pets: [Animal] = []
 
    for _ in 0 ..< quantity {
        let type = inputType()
        if type == "cat" {
            let name = inputName()
            guard let cAge = inputAge() else {continue}
            guard let cMass = inputMass() else {continue}
            let theCat = Cat(name: name, age: cAge, weight: cMass)
            pets.append(theCat)
        }
        else if type == "dog" {
            let name = inputName()
            guard let dAge = inputAge() else {continue}
            guard let dMass = inputMass() else {continue}
            let theDog = Cat(name: name, age: dAge, weight: dMass)
            pets.append(theDog)
        }
        else {
            print("Incorrect input. Unsupported pet type")
        }
    }

    for i in 0 ..< pets.count {
        if(pets[i].age > 0 && pets[i].weight > 0) {
            print(pets[i].toString())
        }
    }
}


writeInfo(inputQuantity())
