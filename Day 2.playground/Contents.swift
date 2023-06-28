import Cocoa

var greeting = "Hello, playground"

// How to store truth with Booleans
let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// How to join strings together

let firstPart = "Hello, "
let secondPart = "world!"
let greeter = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

let luggageCode = "1" + "2" + "3"

//now more efficient using interpolation
let namey = "Taylor"
let age = 26
let message = "Hello, my name is \(namey) and I'm \(age) years old."
print(message)

print("5 x 5 is \(5 * 5)")

//Checkpoint 1
let tempCelcius = 4.0
let tempFarenheit = ((tempCelcius * 9)/5)+32
print(Int(tempFarenheit))
