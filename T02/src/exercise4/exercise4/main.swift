import Foundation

func inputString() -> String? {
    return readLine()
}

func inputQuantity(_ readline: () -> String? ) -> Int {
    print("enter QUANTITY: ")
    if let input = readline(),
       let quantity = Int(input) {
        return quantity
    } else {
        print("Couldn't parse a number. Please, try again")
        return inputQuantity(readline)
    }
}

//тип питомца
func inputType(_ readline: () -> String? ) -> String? {
    print("enter PET'S TYPE: ")
    if let anType = readline(),
       (anType == "dog" || anType == "cat") {
        return String(anType)
    } else {
        print("Incorrect input. Unsupported pet type")
        return nil
    }
}

func inputName(_ readline: () -> String?) -> String {
    print("enter PET'S NAME: ")
    guard let anName = readline() else {
        return inputName(readline)
    }
    return String(anName)
}

func inputAge(_ readline: () -> String?) -> Int? {
    print("enter PET'S AGE: ")
    guard let anAge = readline(),
          let age = Int(anAge),
          age > 0  else {
        print("Incorrect input. Age <= 0")
        return nil
    }
    return age
}

func increaseAge(_ age: Int) -> Int {
    return age > 10 ? age + 1 : age
}

func writeInfoRecursive(_ quantity: Int, _ pets: inout [Animal], _ current: Int = 0) {
    //если уже всех записали
    guard current < quantity else {
        return
    }
    guard let type = inputType( { readLine() }) else {
        writeInfoRecursive(quantity, &pets, current + 1)
        return
    }
    
    let name = inputName( {readLine()} )
    guard let age = inputAge( { readLine() } ) else {
        writeInfoRecursive(quantity, &pets, current + 1)
        return
    }
    
    let newAge = increaseAge(age)
    switch type {
    case "dog":
        let theDog = Dog(name: name, age: newAge)
        pets.append(theDog)
    case "cat":
        let theCat = Cat(name: name, age: newAge)
        pets.append(theCat)
    default:
        print("Incorrect input. Unsupported pet type")
    }
    writeInfoRecursive(quantity, &pets, current + 1)
}

func printPet(_ pets: [Animal], _ count: Int = 0) {
    guard count <  pets.count else {
        return
    }
    print(pets[count].toString())
    printPet(pets, count + 1)
}

func writeInfo(_ quantity: Int) {
    var pets: [Animal] = []
    writeInfoRecursive(quantity, &pets)
    printPet(pets)
}

writeInfo(inputQuantity({readLine()}))
