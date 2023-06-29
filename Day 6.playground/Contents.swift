import Cocoa

var greeting = "Hello, playground"

//how to use a for loop for repeat work
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for name in platforms {
    print("Swift works great on \(name).")
}

for rubberChicken in platforms {
    print("Swift works great on \(rubberChicken).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)


// how to use a while loop to repeat work
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000)

let amount = Double.random(in: 0...1)

// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

var counter = 2
while counter < 64 {
    print("\(counter) is a power of 2.")
    counter *= 2
}

//How to skip loop items with break and continue
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

//Checkpoint 3

for x in 1...100 {
    if x.isMultiple(of: 3) {
        print("Fizz")
    }
    if x.isMultiple(of: 5) {
        print("Buzz")
    }
    if x.isMultiple(of: 3) && x.isMultiple(of: 5) {
        print("FizzBuzz")
    }
    else {
        print(x)
    }
}
