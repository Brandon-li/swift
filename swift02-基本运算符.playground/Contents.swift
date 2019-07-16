import UIKit

print("Hello, playground")

// 1、赋值运算符
// 赋值运算没有返回值
let a = 5
var b = 10
b = a
print(b)

let (x, y) = (1, 2)
print("x: \(x), y: \(y)")

if a == b {
    print("wori ~")
}

// 2、算术运算符
// 默认 不允许在数值运算中出现溢出情况

// 求余运算
let a2 = 100 % 3
print(a2)

// 一元负号运算符
let three = 3
let minuThree = -three
print(minuThree)
let plusThree = -minuThree
print(plusThree)
// 一元正号运算符 --- 没啥用，加了等于没加

// 3、组合赋值运算符
var a3 = 1
a3 += 1
print(a3)

// 4、比较运算符
// ==   !=  >   <   >=  <=
let name = "world"
if name == "world" {
    print("helle \(name)")
}
// 元组比较
(1, "zebra") < (2, "apple")   // true，因为 1 小于 2
(3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
(4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog
("blue", -1) < ("purple", 1)       // 正常，比较的结果为 true
//("blue", false) < ("purple", true) // 错误，因为 < 不能比较布尔类型

// 5、三元运算符
let contentHeight = 50
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight)

// 6、空合运算符
// （a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解包，否则就返回一个默认值 b
let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

// 7、区间运算符
let a7 = 0
let b7 = 100

var sum7 = 0
for index in a7...b7 {
    sum7 += index
}
print(sum7)

for index in 0..<2 {
    print("wori - \(index)")
}
let names = ["a", "b", "c", "d"]
for name in names[2...] {
    print("1 -- \(name)")
}

for name in names[...2] {
    print("2 -- \(name)")
}

// 8、逻辑运算符
// !    &&  ||
let allowedEnter = false
if !allowedEnter {
    print("access denied")
}

// 9、用括号表示优先级
