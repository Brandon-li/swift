import UIKit

print("方法~")

// 1、实例方法
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
print(counter.count)
counter.increment(by: 5)
print(counter.count)
counter.reset()
print(counter.count)

// self 属性
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
    
    // 需要修改 x,y 的值
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
        
        // 可变方法 可以给 self 赋值
        self = Point(x: x, y: y)
    }
}
var somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
somePoint.moveBy(x: 2.0, y: 1.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

