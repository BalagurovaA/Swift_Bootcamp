import Foundation
func inputQuantity() -> Int {
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
    print("ENTER PET'S TYPE: ")
        if let anType = readLine(),
           (anType == "dog" || anType == "cat") {
                return String(anType)
        }
    return ""
}
   

func inputName() -> String {
    var name = ""
    print("ENTER PET'S NAME: ")
    while true {
        if let anName = readLine() {
        name = String(anName)
        return name
        }
    }
}

func inputAge() -> Int {
    print("ENTER PET'S AGE: ")
    if let anAge = readLine(),
       let age = Int(anAge),
       age > 0 {
        return age
    } else {
        print("Incorrect input. Age <= 0")
    }
    return 0
}


func writeInfo(_ quantity: Int) {
    var pets: [Animal] = []
    var count = 0
    while count < quantity {
        let type = inputType()
        
        if type == "cat" {
            let theCat = Cat(name: inputName(), age: inputAge())
            pets.append(theCat)
        }
        else if type == "dog" {
            let theDog = Dog(name: inputName(), age: inputAge())
            pets.append(theDog)
        }
        else {
            print("Incorrect input. Unsupported pet type")
        }
        count += 1
    }
    for i in 0 ..< pets.count {
        if(pets[i].age > 0) {
            print(pets[i].description)
        }
    }
}

writeInfo(inputQuantity())
