import UIKit

print("枚举~")

// 1、枚举语法
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
print(directionToHead)

// 2、使用 switch 匹配枚举值
switch directionToHead {
case .north:
    print("north")
case .east:
    print("east")
case.south:
    print("south")
case .west:
    print("west")
}

// 3、枚举成员变量  - 需要遵循 CaseIterable 协议
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
for aaa in Beverage.allCases {
    print(aaa)
}

// 4、关联值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
print(productBarcode)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
print(productBarcode)

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

// 5、原始值
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
print(Planet2.earth)
let possiblePlanet = Planet2(rawValue: 7)
print(possiblePlanet!)

// 6、递归枚举

