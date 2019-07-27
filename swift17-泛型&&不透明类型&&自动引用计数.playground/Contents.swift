import UIKit

print("泛型&&不透明类型&&自动引用计数")

// 泛型

// 泛型函数
// 使用占位符代表类型 T // 或者任意字母
func swapTwoValues <M> (_ a: inout M, _ b: inout M) {
    let tmp = a
    a = b
    b = tmp
}
var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
print("someInt:\(someInt), anotherInt:\(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someString:\(someString), anotherString:\(anotherString)")


// 命名类型参数
// 请始终使用大写字母开头的驼峰命名法（例如 T 和 MyTypeParameter）来为类型参数命名，以表明它们是占位类型，而不是一个值。

// 泛型类型
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print(stackOfStrings)

let fromTheTop = stackOfStrings.pop()
print("pop value:\(fromTheTop), stack:\(stackOfStrings)")

// 泛型扩展
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items.last
    }
    
}

if let topItem = stackOfStrings.topItem {
    print("top item is \(topItem)")
}

// 类型约束
/**
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
     // 这里是泛型函数的函数体部分
 }
 */
// 遵循可以比较协议
func findIndex<T: Equatable>(ofString valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

// 关联类型通过 associatedtype 关键字来指定
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}


struct IntStack: Container {
    // IntStack 的原始实现部分
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    // Container 协议的实现部分
    typealias Item = Int    // 类型推断可自行判断
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct ElementStack<Element>: Container {
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}


// 关联类型添加约束
/**     关联类型遵循 Equatable 协议
 protocol Container {
     associatedtype Item: Equatable
     mutating func append(_ item: Item)
     var count: Int { get }
     subscript(i: Int) -> Item { get }
 }
 */

// 关联类型约束里使用协议
protocol SuffixableContainer: Container {
    // 1、遵循SuffixableContainer协议
    // 2、里面的类型必须和容器里面的一致
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

//extension IntStack: SuffixableContainer {
//    func suffix(_ size: Int) -> Stack<Int> {
//        var result = Stack<Int>()
//        for index in (count-size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//    // 推断 suffix 结果是 Stack<Int>。
//}

// 泛型 where 语句
func allItemsMatch<C1: Container, C2: Container> (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {
        
        // 检查两个容器含有相同数量的元素
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // 检查每一对元素是否相等
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        // 所有元素都匹配，返回 true
        return true
}
//
//var stackOfStringsaa = Stack<String>()
//stackOfStrings.push("uno")
//stackOfStrings.push("dos")
//stackOfStrings.push("tres")
//var arrayOfStringsaa = ["uno", "dos", "tres"]

extension ElementStack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
var stacks = ElementStack<String>()
stacks.push("uno")
stacks.push("dos")
stacks.push("tres")
stacks.push("cuatro")
print(stacks)

if stacks.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}

// 不透明类型
protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> Shape {
    let top = Triangle(size: 2) // 一个三角
    let middle = Square(size: 2)// 一个矩形
    let bottom = FlippedShape(shape: top) // 一个倒三角
    let trapezoid = JoinedShape(   // 三者结合
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw())


print("自动引用计数")

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}


class Person {
    let name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?
reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1
reference1 = nil
reference2 = nil
//reference3 = nil

var john: Person?
var unit4A: Apartment?
john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

unit4A = nil
john = nil

// 弱引用 weak

// 无助引用
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var johnA: Customer? = Customer(name: "John Appleseed")
johnA!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnA!)

johnA = nil

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name) \n")


// 闭包的循环引用~
class HTMLElement {
    let name:String
    let text:String?

    lazy var asHTML: ()->String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }else {
            return "<\(self.name) />"
        }
    }

    init(name:String, text:String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized ~")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

paragraph = nil

print("\n")
