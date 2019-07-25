import UIKit

print("协议~")

// 协议

// 如果一个类有父类，则父类名放在协议之前
/**
 class SomeClass:SuperClass, FirstProtocol, SecondProtocol {
    // class code ~
 }
 */

// 1、属性要求
protocol FullyName {
    var fullName: String { get }
}

struct Person: FullyName {
    var fullName: String
}

let john = Person(fullName: "John")
print(john.fullName)

class Starship: FullyName {
    var prefix:String?
    var name:String
    
    init(name: String, prefix:String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
//var ncc1701 = Starship(name: "Enterprise", prefix: nil)
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

// 2、方法要求
protocol RandomNumberGenerator {
    func random() -> Double
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

// 3、异变方法要求
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print(lightSwitch)

// 4、构造器要求
/**
 protocol SomeProtocol {
     init()
 }
 
 class SomeSuperClass {
     init() {
         // 这里是构造器的实现部分
     }
 }
 
 class SomeSubClass: SomeSuperClass, SomeProtocol {
     // 因为遵循协议，需要加上 required
     // 因为继承自父类，需要加上 override
     required override init() {
         // 这里是构造器的实现部分
     }
 }
 */

// 5、协议作为类型
class Dice {
    let sides: Int
    // 协议作为类型
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

class One: RandomNumberGenerator {
    func random() -> Double {
        return 1.0
    }
}

var ooo = One()
print(ooo.random())


var d6 = Dice(sides: 6, generator:ooo)
print("Random dice roll is \(d6.roll())")

// 6、委托

// 7、扩展里面添加协议

// 8、有条件的遵循协议

// 9、扩展里声明采纳协议

// 10、协议类型的集合

// 11、协议的继承

// 12、类专属的协议

// 13、协议合成

// 14、检查协议一致性

// 15、可选协议要求

// 16、协议扩展
