import UIKit

print("函数")

// 1、函数参数和返回值
func sayHelloWorld() {
    print("hello, world")
}
sayHelloWorld()

func greet(person: String, alreadyGreeted: Bool) {
    print("\(person) -- alreadyGreeted:\(alreadyGreeted)")
}
greet(person: "a", alreadyGreeted: false)

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// 多返回值
func minAndMax(array:[Int]) ->(min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

print(minAndMax(array: [1, 2, 3, 4]))
let bounds = minAndMax(array: [8, -6, 2, 109, 3, 71])
print(bounds)

// 可选元组返回类型 -- 当数组为空时 返回 nil
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

print("\(String(describing: minMax(array: [])))")

// 2、参数标签
func greet(person:String, home:String){
    print("hello \(person) from \(home)")
}
greet(person: "a", home: "b")

func greet2(_ person:String, _ home:String){
    print("hello \(person) from \(home)")
}
greet2("c", "d")

// 可变参数
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

print(arithmeticMean(1, 2, 3, 4, 5))
print(arithmeticMean(3, 8.25, 18.75))

// inout 代表此参数可用被修改，输入输出参数
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var a = 100
var b = 0
swap(&a, &b)
print("a is \(a), b is \(b)")

// 3、函数类型
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var mathFunction: (Int, Int) ->Int = addTwoInts(_:_:)
print(mathFunction(1, 2))

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(mathFunction, 1, 2)

// 函数作为返回值
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveToO = chooseStepFunction(backward: false)
print(moveToO)


// 4、嵌套函数
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue2 > 0)
while currentValue2 != 0 {
    print("\(currentValue2)... ")
    currentValue2 = moveNearerToZero(currentValue2)
}
print("zero!")
