import UIKit

print("控制流~")

// 1、for-in
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print(name)
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (key, value) in numberOfLegs {
    print("key:\(key), value:\(value)")
}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)

let minuteInterval = 5
for trickMark in stride(from: 0, to: 60, by: minuteInterval) {
    print(trickMark)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print(tickMark)
}

// 2、while 循环
var square = 0
var finalSquare = 10
while square <  finalSquare {
    square += 1
    print("square - \(square)")
}
print("game over ~")

square = 0
finalSquare = 10

repeat {
  square += 2
    print("repeat: \(square)")
} while square < finalSquare

print("game over ~")

// 3、条件语句
var temperatureInFahrenheit = 30
if temperatureInFahrenheit < 32 {
    print("aaaaaaa:\(temperatureInFahrenheit)")
}

//  switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("a -- z")
}

// 不能隐式贯穿
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 区间匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1 ..< 10:
    naturalCount = "1--10"
case 10...100:
    naturalCount = "10 - 100"
default:
    naturalCount = "many"
}
print(naturalCount)

// switch 元组
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("0 - 0")
case (_, 0):
    print(" -- 0")
case (0, _):
    print("0 ---")
case (-2 ... 2, -1 ... 1) :
    print("就是这个啦~")
default:
    print("some else")
}

// 值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y: // x == y
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y: // x == -y
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):    // others
    print("(\(x), \(y)) is just some arbitrary point")
}

let someOtherCharacter: Character = "e"
switch someOtherCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

// 4、控制转移语句
// continue/break/return

// fallthrough -- 贯穿，接着执行下一条 case 语句
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

// guard

func greet(person: [String : String]) {
    guard let name = person["name"] else {
        print("has no name ~")
        return ;
    }
    print("hello \(name)")
    
    guard let location = person["location"] else {
        print("\(name) has no lication ~")
        return
    }
    print("\(name) has location of \(location)")
}

greet(person: ["a":"b"])
greet(person: ["name" : "wori"])
greet(person: ["name": "a", "location" : "b"])

// 5、检测 API 是否可用
//if #available(平台名称 版本号, ..., *) {
//    APIs 可用，语句将执行
//} else {
//    APIs 不可用，语句将不执行
//}
