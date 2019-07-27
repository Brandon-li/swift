import UIKit

// 简单值
var str = "Hello, playground"
print(str)

let a : Float = 4

let label = "the world is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)


// 将值转换成字符串类型
let apples = 3
let summary = "i have \(apples) apples"
print(summary)

let b:Float = 1.23
let helloB = "hello \(b)"
print(helloB)

// 多行字符串内容
let quotation = """
i said "i have \(apples) apples."

And then i said "hello \(b)"
"""
print(quotation)

// [] 创建数组和字典
var shoppingList = ["a", "b", "c"]
shoppingList[0] = "D"
print(shoppingList)

var occupations = [
    "a":1,
    "b":2,
    "c":120
]
occupations["c"] = 3
print(occupations)

let emptyArray = [String]()
let emptyDict  = [String:Float]()

shoppingList = []
occupations = [:]

print(shoppingList)
print(occupations)

// 控制流
let individualScore = [1, 2, 3, 4, 5, 6]
var teamScore = 0
for score in individualScore {
    if score >= 5 { // if 必须是 BOOL 不会非0即为正
        teamScore += score
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting += name
}else {
    greeting = "123123"
}
print(greeting)

let nickName: String? = nil
let fullName = "J"
let informalGreeting = "hi \(nickName ?? fullName)"
print(informalGreeting)

let vegetable = "red pepper"
switch vegetable {
case "aaaa":
    print("aaaa")
case "bbb", "ccc" :
    print("b-c")
default:
    print("red")
}

let interestingNumbers = [
    "aaa": [2, 3, 5, 7, 11, 13],
    "bbb": [1, 1, 2, 3, 5, 8],
    "ccc": [1, 4, 9, 16, 25],
]
var largest = 0
var largKind: String? = nil

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largKind = kind
        }
    }
}
print(largest, largKind!)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat{
    m *= 2
} while m < 100
print(m)

var total = 0
for i in 0...4 {
    total += i
}
print(total)


// 函数和闭包
func greet(person: String, day: String) ->String {
    return "hello \(person), today is \(day) ~"
}
print(greet(person: "a", day: "123"))

func greet(_ preson: String, on day: String) ->String {
    return "hello \(preson), today is \(day) ~"
}
print(greet("111", on: "123"))

// 使用元组来生成复合值，元组的元素可以使用名称或数字来获取
func calculateStatistics(source:[Int]) -> (min:Int, max:Int, sum:Int) {
    var min = source[0]
    var max = source[0]
    var sum = 0
    
    for score in source {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(source: [1, 2, 3, 4, 5])
print(statistics.sum)
print(statistics.0)
print(statistics)

// 函数可以嵌套，嵌套函数可以访问外侧函数的变量

func returnFifteen() ->Int {
    var x = 10
    func add() {
        x += 5
    }
    add()
    return x
}

returnFifteen()

// 函数是一等公民，函数可以作为另一个函数的返回值
func makeIncrementer() ->((Int) -> (Int)) {
    func addOne(number: Int) ->Int {
        return 1+number
    }
    return addOne(number:)
}
var increment = makeIncrementer()   // 返回值是一个函数
increment(7)

// 函数可以作为参数
func hasAnyMatches(list:[Int], condition:(Int) ->Bool) ->Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) ->Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen(number:))

numbers.map { (number: Int) -> Int in
    let result = 3 * number
    return result
}

let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)


//let mappedNumbers2 = numbers.map { (number: Int) -> Int in
//
//    let result = number % 2 == 1 ? 0 : number
//    return result
//}
//print(mappedNumbers2)

let sortedNumbers = numbers.sorted{$0 > $1}
print(sortedNumbers)

// 类和对象
class Shape {
    var numberOfSlides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSlides) sildes ~"
    }
}

var shape = Shape()
shape.numberOfSlides = 2
var shapeDescription = shape.simpleDescription()
print(shapeDescription)

class NamedShape {
    var numberOfSlider: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSlider) sildes ~"
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength:Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSlider = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let sss = Square.init(sideLength: 5.0, name: "my test square")
sss.area()
sss.simpleDescription()


class Circle: NamedShape {
    var banjing: Double = 0.0
    
    init(banjing: Double, name: String) {
        self.banjing = banjing ;
        super.init(name: name)
    }
    
    func area() -> Double {
        return banjing * banjing * Double.pi / 2.0
    }
    
    override func simpleDescription() -> String {
        return "aaaaaa \(area())"
    }
}

let ccc = Circle.init(banjing: 2, name: "cccccc")
ccc.area()
ccc.simpleDescription()

// getter / setter 方法
class EquilateralTrangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength:Double, name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSlider = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            // 注意 newValue
            sideLength = newValue / 3.0
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTrangle.init(sideLength: 3.0, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// willSet didSet
class TraingleAndSquare {
    var traingle: EquilateralTrangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            traingle.sideLength = newValue.sideLength
        }
    }
    
    init(size:Double, name:String) {
        square = Square.init(sideLength: size, name: name)
        traingle = EquilateralTrangle.init(sideLength: size, name: name)
    }
}

var traingleAndSquare = TraingleAndSquare.init(size: 10, name: "another test shape")
print(traingleAndSquare.square.sideLength)
print(traingleAndSquare.traingle.sideLength)

traingleAndSquare.square = Square.init(sideLength: 50, name: "larger square")
print(traingleAndSquare.traingle.sideLength)

// 可选值类型 ？
let optionalSquare:Square? = Square.init(sideLength: 2.5, name: "op")
let sideLength = optionalSquare?.sideLength
print(sideLength!)

// 枚举和结构体
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queue, king
    
    func simpleDescription() ->String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queue:
            return "queue"
        case .king:
            return "king"
            
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
print(ace.simpleDescription())

if let rank = Rank.init(rawValue: 3) {
    let threeDes = rank.simpleDescription()
    print(threeDes)
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() ->String {
        switch self {
        case .spades:
            return "spades"
        case.hearts:
            return "hearts"
        case .diamonds:
            return "dia"
        case.clubs:
            return "cluns"
        }
    }
    
    func color() ->String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartDes = hearts.simpleDescription()
let heartColor = hearts.color()

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case wori(Int)
}
let success = ServerResponse.result("a", "b")
let failure = ServerResponse.failure("c")
let responseWori = ServerResponse.wori(10)

switch responseWori {
case let .result(aaa, bbb):
    print("a is \(aaa) and b is \(bbb)")
case let .failure(message):
    print("message is \(message)")
case let .wori(ddd):
    print("wori \(ddd)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDes = threeOfSpades.simpleDescription()

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 1234
    
    func adjust() {
        simpleDescription += " wori~"
    }
}
var aa = SimpleClass()
aa.adjust()
let aDesc = aa.simpleDescription
print(aDesc)

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "a simple struct"
    
    mutating func adjust() {
        simpleDescription += " wori wori ~"
    }
}
var bb = SimpleStruct()
bb.adjust()
let bDesc = bb.simpleDescription
print(bDesc)

enum SimpleEnum: ExampleProtocol {
    case a, b, c, d, e, f
    
    var simpleDescription: String {
        switch self {
        case .a:
            return "a"
        case .b:
            return "b"
        case .c:
            return "c"
        case .d, .e, .f :
            return "d-f"
        }
    }
    
    mutating func adjust() {
        switch self {
        case .a, .b, .c:
            print("simple enum a b c")
        default:
            print("another enum ~")
        }
    }
}

var simpleEnum = SimpleEnum.a
print(simpleEnum.simpleDescription)
print(simpleEnum.adjust())

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "number of self is \(self)"
    }
    mutating func adjust() {
        self += 1
    }
}
print(10.simpleDescription)

var  zzz  = 10
zzz.adjust()
print("zzz adjust is \(zzz)")

extension Double {
    var absoluteValue: Double {
        return self > 0 ? self : self * -1
    }
}
let aDoubne: Double = -10.0
print("-10 absoluteValue is \(aDoubne.absoluteValue)")


// 错误处理
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func sendaaaa(job: Int, toPrinter printerName: String) throws ->String {
    if printerName == "Never" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try sendaaaa(job: 1, toPrinter: "Never11")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try sendaaaa(job: 1, toPrinter: "Never")
    print(printerResponse)
} catch PrinterError.outOfPaper{
    print("0")
} catch PrinterError.noToner {
    print("1")
} catch PrinterError.onFire {
    print("2")
}

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("milk")
print(fridgeIsOpen)


// 泛型 ~
//func makeArray<Int>(repeating item:Int, numberOfTimes: Int) ->[Int] {
//    var result = [Int]()
//    for _ in [0, numberOfTimes] as [Any] {
//        result.append(item)
//    }
//    return result
//}

var aSum = 0
let aMax = 101


for _ in 1 ..< aMax {
    aSum += 1
}
print(aSum)


func getSun(repeating: Int, items: Int) ->Int {
    var sum = 0
    for _ in 0 ..< items {
        sum += 1
    }
    return sum
}

print(getSun(repeating: 1, items: 100))

func makeArrayaaa(repeating: Int, items: Int) ->[Int] {
    
    var result = [Int]()
    for _ in 0 ..< items {
        result.append(repeating)
    }
    return result
}


print(makeArrayaaa(repeating: 1, items: 3))
