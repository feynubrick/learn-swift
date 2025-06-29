// 반복문
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print("teamScore:", teamScore)

// if 문
let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}

print("Score:", teamScore, scoreDecoration)

// nul and optional
var optionalString: String? = "Hello"
print(optionalString == nil) // null -> nil

var optionalName: String? = "John Appleseed"
// var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)

let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print("informalGreeting:", informalGreeting)

// Swith-case
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwitch.")
case let x where x.hasSuffix("pepper"): // lambda 함수처럼 쓰임
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


// for in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)


// while and repeat
var n = 2
while n < 100 {
    n *= 2
}
print("n:", n)


var m = 2
repeat {
    m *= 2
} while m < 100
print("m:", m)

// range of indices
var total = 0
for i in 0..<4 {
    total += i
}
print("total:", total)