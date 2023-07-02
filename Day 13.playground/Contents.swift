import Cocoa

var greeting = "Hello, playground"

// how to create and use protocols
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 200)

// how to use opaque return types

protocol View { }

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

// how to create and use extensions

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    mutating func trim() {
        self = self.trimmed()
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178)


// how to create and use protocol extensions
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// checkpoint 8

protocol Building {
    var roomAmount: Int { get }
    
    var cost: Int { get set }
    
    var agentName: String { get set }
    
    func salesSummary()
}

struct House: Building {
    var roomAmount: Int = 10
        
    var cost = 1_000_000
        
    var agentName = "Michelle Trinh"
        
    func salesSummary() {
        print("This house has \(roomAmount) rooms and costs \(cost). If you would like to learn more about this property, please contact \(agentName) with any questions you may have.")
    }
}

struct Office: Building {
    var roomAmount: Int = 500
        
    var cost = 50_000_000
        
    var agentName = "Michelle Trinh"
        
    func salesSummary() {
        print("This office building has \(roomAmount) rooms and costs \(cost). If you would like to learn more about this property, please contact \(agentName) with any questions you may have.")
    }
}

let myHouse = House()

print("Room Amount: \(myHouse.roomAmount)")
print("Cost: \(myHouse.cost)")
print("Agent Name: \(myHouse.agentName)")

myHouse.salesSummary()

let myOffice = Office()

print("Room Amount: \(myOffice.roomAmount)")
print("Cost: \(myOffice.cost)")
print("Agent Name: \(myOffice.agentName)")

myOffice.salesSummary()

