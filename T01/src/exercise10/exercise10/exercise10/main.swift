import Foundation

func inputQuantity() -> Int {
    var quantity: Int = 0
    if let input1 = readLine(),
           let quant = Int(input1) {
            if(quant > 0) {
                quantity = quant
            } else {
                print("Input error. Size <= 0")
            }
    } else {
            print("Couldn't parse a number. Please, try again")
            return inputQuantity()
    }
    return quantity
}
    
func inputData() -> (String, Int) {
    var name: String = ""
    var age: Int = 0
    
    if let input2 = readLine() {
        name = input2
    }
    if let input1 = readLine(),
       let numbAge = Int(input1) {
        age = numbAge
    }
    return (name, age)
}

func checkTheAge(users: [User]) -> [User] {
    let invalidUsers = users.filter {$0.age < 0}
    if(!invalidUsers.isEmpty) {
        print("Incorrect input. Age <= 0")
    }
    return users.filter { $0.age >= 18 }
}

func writeIntoUser(){
    var arrRes: [User] = []
    let quantity: Int = inputQuantity()
    while arrRes.count != quantity {
        let data: (String, Int) = inputData()
        let user = User(name: data.0, age: data.1)
        arrRes.append(user)
    }
    
    let varr = checkTheAge(users: arrRes)
    var finalNames: [String] = []
    for user in varr {
        finalNames.append(user.name)
    }
    let res = finalNames.joined(separator: ", ")
    print(res)
    
}

writeIntoUser()
