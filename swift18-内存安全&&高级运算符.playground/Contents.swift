import UIKit

print("内存安全 && 高级运算符")

// 内存安全

var one = 1
print("one is \(one) !")


var stepSize = 1

func increment(_ number: inout Int) {
    number += stepSize
}

//increment(&stepSize)

var copySize = stepSize
increment(&copySize)

print(stepSize, copySize)


func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // 正常
print(playerOneScore, playerTwoScore)
//balance(&playerOneScore, &playerOneScore)

struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // 正常

print(oscar.health, maria.health)

//oscar.shareHealth(with: &oscar)

print("\n高级运算符\n")

// ~ 按位取反
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits // 等于 0b11110000
print(initialBits, invertedBits)

// & 与
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
// 等于 00111100
let middleFourBits = firstSixBits & lastSixBits
print(firstSixBits, lastSixBits, middleFourBits)

// | 或
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits // 等于 11111110
print(someBits, moreBits, combinedbits)

// ^ 异或
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits // 等于 00010001
print(firstBits, otherBits, outputBits)

// << 左移     >> 右移
let shiftBits: UInt8 = 4 // 即二进制的 00000100
shiftBits << 1           // 00001000
shiftBits << 2           // 00010000
shiftBits << 5           // 10000000
shiftBits << 6           // 00000000
shiftBits >> 2           // 00000001
print(shiftBits)

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16  // redComponent 是 0xCC，即 204
let greenComponent = (pink & 0x00FF00) >> 8 // greenComponent 是 0x66， 即 102
let blueComponent = pink & 0x0000FF         // blueComponent 是 0x99，即 153

// 溢出运算符
var potentialOverflow = Int16.max
print(potentialOverflow)
potentialOverflow &+= 1
print(potentialOverflow)

var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1
print(unsignedOverflow)



// 运算符函数
struct Vector2D {
    var x = 0.0, y = 0.0
}
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print(combinedVector)

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative
print(positive, negative, alsoPositive)

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
print(original)

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

prefix operator +++
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}


var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print(afterDoubling)
