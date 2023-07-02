import Cocoa

var greeting = "Hello, playground"

// how to make your own classes
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// how to make one class inherit from another

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

// how to add initializer for classes

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// how to copy classes

class User {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}


var user1 = User()
var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

// how to create a deinitializer for a class

class Users {
    let id: Int

    init(id: Int) {
        self.id = id
        print("Users \(id): I'm alive!")
    }

    deinit {
        print("Users \(id): I'm dead!")
    }
}

for i in 1...3 {
    let userd = Users(id: i)
    print("Users \(userd.id): I'm in control!")
}

// how to work with variables inside classes
// difficult to take notes for as it redeclares variables

// checkpoint 7

class Animals {
    let legs: Int = 4
}

class Dog: Animals {
    func speak() {
        print("woof woof!")
    }
}

class Cat: Animals {
    func speak() {
        print("meow meow")
    }
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        
    }
}

class Corgi: Dog {
    override func speak() {
        print("bork bork!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("awoof awoof!")
    }
}

class Persian: Cat {
    override func speak() {
        print("mew mew")
    }
}

class Lion: Cat {
    override func speak() {
        print("ROAR")
    }
}

let corgi = Corgi()
let poodle = Poodle()
let persian = Persian(isTame: true)
let lion = Lion(isTame: true)

corgi.speak()
poodle.speak()
persian.speak()
lion.speak()
