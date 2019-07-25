import UIKit

print("嵌套类型&&扩展")

// 嵌套类型
struct BlackjackCard {
    
    // 嵌套的 Suit 枚举
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    // 嵌套的 Rank 枚举
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard 的属性和方法
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}
let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")

// 在外部引用嵌套类型，需要在m类型名钱加上外部类型的类型名作为前缀
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
print(heartsSymbol)


print("扩展")
/** Swift 中的扩展可以：
 *  添加计算型实例属性和计算型类属性
 *  定义实例方法和类方法
 *  提供新的构造器
 *  定义下标
 *  定义和使用新的嵌套类型
 *  使已经存在的类型遵循（conform）一个协议
 */

// 1、计算型属性
extension Double {
    var km: Double {
        return self * 1000.0
    }
    var m: Double {
        return self
    }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

// 构造器
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center:Point, size:Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
print(centerRect)

// 方法
extension Int { // 循环 Int 次 task
    func repetitions(task:() ->Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    mutating func square() {
        self *= self
    }
}

3.repetitions {
    print("aaaaaaaaa~")
}

var someInt = 3
someInt.square()
print(someInt)

// 嵌套类型
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
