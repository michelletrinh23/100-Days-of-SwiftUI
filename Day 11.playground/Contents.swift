import Cocoa

var greeting = "Hello, playground"

// how to limit acces to internal data using access control

struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

//account.funds -= 1000

// static properties and methods

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

//Checkpoint 6
struct CarInfo {
    let model: String
    let numberOfSeats: Int
    var currentGear: Int
    var changeGears: String
    
    mutating func whatGear() {
        if changeGears == "Up" {
            currentGear += 1
            print(currentGear)
        }
        else if changeGears == "Down" {
            currentGear -= 1
            print(currentGear)
        }
        else {
            print("The only input allowed is 'Up' or 'Down' for gear change.")
        }
    }
}

var car = CarInfo(model: "Toyota", numberOfSeats: 5, currentGear: 1, changeGears: "Down")
car.whatGear()
print(car)
