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

func writeInfo(_ quantity: Int) -> [Animal] {
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
    return pets
}


func walkWithPets(_ genStart: Date,  _ pets: [Animal]) async  {
   
    await withTaskGroup(of: Void.self) { walks in
        for pet in pets {
            walks.addTask {
                let start = Date()
                do {
                    try await pet.goToWalk()
                    let finishTime = Date()
                    
                    let startSec = String(format: "%.2f", start.timeIntervalSince(genStart))
                    let finishSec = String(format: "%.2f", finishTime.timeIntervalSince(genStart))

                    
                    print("Pets' info: \(pet.toString()) ; start date \(startSec) ; end time \(finishSec) ; ")
                   
                } catch {
                    print("error!")
                }
            }
        }
    }
}


    var generalStart = Date()
    var quantity = inputQuantity()
    var pets = writeInfo(quantity)
    await walkWithPets(generalStart, pets)
