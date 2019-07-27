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
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

// 7、扩展里面添加协议
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice:TextRepresentable {
    var textualDescription: String{
        return "a \(sides)-sides dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)


// 8、有条件的遵循协议
// 下面的扩展让 Array 类型只要在存储遵循 TextRepresentable 协议的元素时就遵循 TextRepresentable 协议。
extension Array : TextRepresentable where Element: TextRepresentable {
    var textualDescription: String{
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let myDice = [d12, d6]
print(myDice.textualDescription)

// 9、扩展里声明采纳协议
struct Hamster {
    var name:String
    var textualDescription: String {
        return "a hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}
let simonTheHamster = Hamster(name: "Simon")
print(simonTheHamster.textualDescription)

// 10、协议类型的集合
let things:[TextRepresentable] = [d12, d6, simonTheHamster]

for thing in things {
    print(thing.textualDescription)
}

// 11、协议的继承
//继承自一个协议的另一个协议
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}


// 12、类专属的协议
// 添加 AnyObject 就规定协议只能被类遵守
//protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
//    // 这里是类专属协议的定义部分
//}

// 13、协议合成
// 用 & 将协议组合起来
protocol Named13 {
    var name: String { get }
}
protocol Aged13 {
    var age: Int { get }
}
struct Person13: Named13, Aged13 {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named13 & Aged13) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person13(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

// 定位
class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named13 {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
// 接收一个类型为 location & nameed13 类型的参数
func beginConcert(in location: Location & Named13) {
    print("Hello, this is \(location.name)!")
}
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)

// 14、检查协议一致性
//
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects:[AnyObject] = [Circle(radius: 2.0), Country(area: 243_610), Animal(legs: 4)]

for object in objects {
    if let obWithArea = object as? HasArea {
        print("area is \(obWithArea.area)")
    }else {
        print("something doesnt have an area: \(object)")
    }
}
