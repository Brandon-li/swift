import UIKit

print("下标 && 继承")

// 下标
// subscript 关键字允许访问下标

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

// 下标用法
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
print(numberOfLegs)
// 下标选项
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
print(matrix)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print(matrix)

// 继承
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
    }
}
let someVehicle = Vehicle()
print(someVehicle.description)

class Bicyle: Vehicle {
    var hasBasket = false
}

let bicyle = Bicyle()
bicyle.hasBasket = true
bicyle.currentSpeed = 15.0
print("Bicycle: \(bicyle.description)")

class Tandem: Bicyle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 20.0
print("Tandem: \(tandem.description)")

// 重写 override
class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("Train make noise: Choo Choo")
    }
}
let train = Train()
train.makeNoise()

// 重写属性
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear: \(gear)"
    }
}

let car = Car()
car.currentSpeed = 50.0
car.gear = 3
print("car: \(car.description)")


// 重写属性观察器
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(self.currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

// 防止重写

class AutomaticCaraaa: Car {
    final var wori = "AutomaticCaraaa"
}

//class bbbbb : AutomaticCaraaa {
//    override var wori {
//    }
//}
