import UIKit

print("属性")

// 1、存储属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems)

// 结构体是值类型，声明成了常亮，就不能变了
//// 声明成了不可变的，不能修改
//let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6

// 延迟加载属性
// 如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("some data")
manager.data.append("some data more")
print(manager.data)
print(manager.importer.fileName)

// 2、计算属性
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var w = 0.0, h = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.w / 2.0
            let centerY = origin.y + size.h / 2.0
            return Point(x: centerX, y: centerY)
        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.w / 2)
//            origin.y = newCenter.y - (size.h / 2)
//        }
        // 简化 setter 声明 -- 默认参数名 newValue
        set {
            origin.x = newValue.x - size.w / 2.0
            origin.y = newValue.y - size.h / 2.0
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(w: 100, h: 100))
let initialSquareCenter = square.center
print(initialSquareCenter)
square.center = Point(x: 150.0, y: 150.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// 只读属性
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    // 只读，只有 getter 没有 setter
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

// 3、属性观察器
/**
 willSet 观察器会将新的属性值作为常量参数传入，在 willSet 的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称 newValue 表示。
 同样，didSet 观察器会将旧的属性值作为参数传入，可以为该参数指定一个名称或者使用默认参数名 oldValue。如果在 didSet 方法中再次对该属性赋值，那么新值会覆盖旧的值。
 */
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("将 totalSteps 的值设置为 \(newValue)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896


// 4、全局变量和局部变量

// 5、类型属性
// 静态属性
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    // 类属性
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
