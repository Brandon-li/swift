import UIKit


// 0、常量和变量
var current0 = 1.0
var welcomeMessage: String
let 🐶🐮 = "dogcow"

print(🐶🐮)
print("The current value of friendlyWelcome is \(🐶🐮)")

// 1、注释 -- 这是一个煮熟

// 2、分号 -- 在一行内写多条语句的时候需要添加分号
let cat = "🐱"; print(cat)

// 3、整数
let minValue = UInt8.min
let maxValue = UInt8.max
print("UInt8 min is \(minValue), max is \(maxValue)")

// 32位机器上 Int == Int32, 64位机器上 Int == Int64
let minValue1 = Int.min
let maxValue1 = Int.max
print("Int min is \(minValue1), max is \(maxValue1)")

// 4、浮点数
// float、double 两种都匹配的情况下优先选择 doubel

// 5、类型安全和类型推断
// swift 是类型安全的语言。

let meaningoflife = 42 // 推断为 Int 类型
let pi = 3.14          // 推断为 Double 类型

let anotherPi = 3 + 0.14 // 推断为 Doubel 类型

// 6、数值型字面量
/**
 *  十进制 无前缀
 *  二进制 前缀 0b
 *  八进制 前缀 0o
 *  十六进制 前缀 0x
 */
let hexadecimalInteger = 0x11
print(hexadecimalInteger)

let oneMillion = 1_000_000
print(oneMillion)

// 7、数值类型转换 SomeType(ofInitialValue)
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
print(twoThousandAndOne)

let integerPi = Int(pi)
print(integerPi)    // 去除小数点

// 8、类型别名
// typealias xxx = aaa 给现有类型起个别名
typealias AudioSample = UInt8
let minValue8 = AudioSample.min
print("类型别名：\(minValue8)")

// 9、布尔值
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("turnipsAreDelicious is true")
}else {
    print("turnipsAreDelicious is false")
}

let xxxx9 = 1
if xxxx9 == 1 {
    print("bool")
}

// 10、元组
let httpError = (404, "Not Found")
let (statusCode, statusMessage) = httpError
print("code is \(statusCode), message is \(statusMessage)")

let (statusCode1, _) = httpError
print("code is \(statusCode1)")

print("code is \(httpError.0), message is \(httpError.1)")

let http200Status = (statusCode: 200, statusMessage: "OK")
print("codel is \(http200Status.statusCode), message is \(http200Status.statusMessage)")

// 11、可选类型
let passableNum = "123"
let convertedNum = Int(passableNum)!
print(convertedNum)

var serverCode: Int? = 404
print(serverCode!)
serverCode = nil

var sureAnswer: String?
print(sureAnswer as Any)
sureAnswer = "wori"
// if 语句以及强制解析
if sureAnswer == nil {
    print("is nil ~")
}else {
    print("is \(sureAnswer!)")
}
// 可选绑定
if let actNum = Int(passableNum) {
    print("num is \(actNum)")
}else {
    print("num is nil ")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// 隐式解析可选类型
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号

if assumedString != nil {
    print(assumedString!)
}
if let defString = assumedString {
    print(defString)
}

// 12、错误处理

func canThrowError() throws {
    // this func can throw an error
}
do {
    // 没有错误
    try canThrowError()
} catch  {
    // 捕获错误
}

// 断言和先决条件
let age = 3
assert(age >= 0, "age cannot be less than O")

if age > 10 {
    print(" 10 岁啦~")
}else if (age > 0){
    print("是个人 ~")
}else {
    assertionFailure("age cannot be less than O")
}
// 强制执行先决条件

