import UIKit

print("闭包~")

// 1、闭包表达式
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
// 闭包
var reversedNames = names.sorted(by: backward(_:_:))
// 内联闭包
reversedNames = names.sorted { (a, b) -> Bool in
    return a < b
}
// 根据上下文推断
reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})

// 单表达式隐式返回
reversedNames = names.sorted(by: {s1, s2 in s1 < s2})

// 参数名称缩写
reversedNames = names.sorted(by: {$0 > $1})

// 运算符方法
reversedNames = names.sorted(by: <)
print(reversedNames)


// 2、尾随闭包
reversedNames = names.sorted {$0 > $1}
print(reversedNames)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    
    var number = number
    var outpot = ""
    
    repeat {
        outpot = digitNames[number%10]! + outpot
        number /= 10
    }while number > 0
    
    return outpot
}
print(strings)

// 3、值捕获
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    // 此嵌套函数捕获 runningTotal 和 amount
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
print(makeIncrementer(forIncrement: 2))

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

// 各自有各自的值捕获
let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())

// 4、闭包是引用类型
let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())

// 5、逃逸闭包
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// 6、自动闭包
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
print("Now serving \(customerProvider())!")
print(customersInLine.count)
