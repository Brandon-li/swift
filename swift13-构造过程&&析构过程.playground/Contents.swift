import UIKit

print("构造过程 && 析构过程")

// 构造过程
// 1、自定义构造过程
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperatureInCelsius)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperatureInCelsius)

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// 可选属性类型
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."
print(cheeseQuestion.response!)

// 构造过程中 常量属性赋值
// text 是常量，但是在构造器中可以设置他的值
class SurveyQuestionA {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestionA(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"

// 默认构造器
// 所有属性都有默认值，并且没有父类
class ShoppingListItem {
    var name : String?
    var quantity = 1
    var purcheased = false
}
var item = ShoppingListItem()

// 结构体的逐一成员构造器
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTow = Size(width: 2.0, height: 2.0)

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {
    }
    init(origin:Point, size:Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
var basicRect = Rect()
print("x:\(basicRect.origin.x), y:\(basicRect.origin.y), w:\(basicRect.size.width), h:\(basicRect.size.height)")
basicRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
print("x:\(basicRect.origin.x), y:\(basicRect.origin.y), w:\(basicRect.size.width), h:\(basicRect.size.height)")
basicRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
print("x:\(basicRect.origin.x), y:\(basicRect.origin.y), w:\(basicRect.size.width), h:\(basicRect.size.height)")

// 类的继承和构造过程
// 类里面的所有存储型属性——包括所有继承自父类的属性——都必须在构造过程中设置初始值。

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print(vehicle.description)

class Bicyle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicyle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
    }
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
// Hoverboard: 0 wheel(s) in a beautiful silver

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
print(namedMeat.name)
let mysteryMeat = Food()
print(mysteryMeat.name)

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

// 可失败构造器
struct Animal {
    let species: String?
    
    init?(species: String){
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
print(someCreature!)
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(String(describing: giraffe.species))")
}

// 枚举类型的可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
// 带原始值的枚举类型的可失败构造器
enum TemperatureUnitA: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnitA = TemperatureUnitA(rawValue: "F")
if fahrenheitUnitA != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
let unknownUnitA = TemperatureUnitA(rawValue: "X")
if unknownUnitA == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

// 重写一个可失败构造器
class Document {
    var name: String?
    // 该构造器创建了一个 name 属性的值为 nil 的 document 实例
    init() {}
    // 该构造器创建了一个 name 属性的值为非空字符串的 document 实例
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

/** 必要构造器   -- 子类重写的时候不需要加 override
 class SomeClass {
     reuqired init {
     }
 }
 */

// 通过闭包来设置属性值
struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}
let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))


// 析构函数         - deinit
// 银行初始钱一万，包含取钱和存钱两个动作
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}
// 玩家有一定的钱
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        print("析构函数触发~")
        Bank.receive(coins: coinsInPurse)
    }
}
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")
