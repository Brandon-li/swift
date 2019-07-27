import UIKit

print("Hello, playground")

// 1、字符串字面量
let someString = "Some string literal value"
// 多行字符串字面量
let quotation = """
我
日
"""

print(quotation)

// \ 表示实际不换行
let softWrappedQuotation = """
我\
日
"""
print(softWrappedQuotation)

// 特殊字符
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"             // $，Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥，Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖，Unicode 标量 U+1F496
print("1-\(wiseWords) - 2-\(dollarSign) - 3-\(blackHeart) - 4-\(sparklingHeart)")

// 2、初始化空字符串
var emptyString = ""
var anoEmptyString = String()

if emptyString.isEmpty {
    print("emptyString is empty ~")
}

// 3、字符串可变性
var variableString = "Horse"
variableString += " and carriage"
print(variableString)

// 4、字符串是值类型
for character in "🐶🐈🐖" {
    print(character)
}

// 5、连接字符串和字符
let string1 = "hello"
let string2 = " world"
var welcome = string1 + string2
print(welcome)

var instruction = "look"
 instruction += string2
print(instruction)

instruction.append(string1)
print(instruction)

// 6、字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)

// 7、Unicode

// 8、计算字符数量
var unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
unusualMenagerie += "\u{301}"
print("\(unusualMenagerie) has \(unusualMenagerie.count) characters")
// 打印输出“unusualMenagerie has 40 characters”

// 9、访问修改字符串
let greeting = "Guten Tag!"
print(greeting[greeting.startIndex])
// G
print(greeting[greeting.index(before: greeting.endIndex)])
// !
print(greeting[greeting.index(after: greeting.startIndex)])
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(greeting[index])
// a
welcome.insert("!", at: welcome.endIndex)
print(welcome)

welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)

// 9、子字符串
let greeting9 = "Hello, world!"
let index9 = greeting9.firstIndex(of: ",") ?? greeting.endIndex
let beginning9 = greeting9[..<index9]
// beginning 的值为 "Hello"

// 把结果转化为 String 以便长期存储。
let newString = String(beginning9)
print(newString)

// 10、计较字符串
let quotation10 = "We're a lot alike, you and I."
let sameQuotation10 = "We're a lot alike, you and I."
if quotation10 == sameQuotation10 {
    print("These two strings are considered equal")
}

let remoteStr = "Act 1 Scene 1: Verona, A public place"
if remoteStr.hasPrefix("Act") {
    print(remoteStr)
}
if remoteStr.hasSuffix("place") {
    print(remoteStr)
}

