import Cocoa

var greeting = "Hello, playground"

// how to provide default values for parameters

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

//how to handle errors in functions

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "hello"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}


//Checkpoint 4

enum NumberError: Error {
    case outOfBounds
    case noRoot
}

var y = 17

func numero(_ number: Int) throws -> String {
    let squareRoot = pow(Double(y), 0.5)
    if number >= 1 && number <= 100 {
        print(squareRoot)
    }
    if number < 1 || number > 10000 {
        throw NumberError.outOfBounds
    }
    if squareRoot != Double(Int(squareRoot)) {
        throw NumberError.noRoot
    }
    return String(squareRoot)
}

do {
    let result = try numero(y)
    print("Square root: \(result)")
} catch NumberError.outOfBounds {
    print("out of bounds")
} catch NumberError.noRoot {
    print("no root")
} catch {
    print("There was an error.")
}
