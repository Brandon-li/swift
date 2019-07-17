import UIKit

print("集合类型 ~")

// 集合都是可变类型

// 1、数组
var someInts = [Int]()
print("someInts is \(someInts)")
someInts.append(2)
print("someInts is \(someInts)")

var threeDoubles = Array(repeating: 0.0, count: 3)
print("- \(threeDoubles)")

var anoThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anoThreeDoubles
print("six: \(sixDoubles)")

//var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList = ["Eggs", "Milk"]
print("The shopping list contains \(shoppingList.count) items.")


shoppingList.isEmpty ? print("The shopping list is empty.") : print("The shopping list is not empty.")

shoppingList += ["Baking Powder"]
print("list: \(shoppingList)")
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
print("list: \(shoppingList)")

var firstItem = shoppingList[0]
print(firstItem)
shoppingList[0] = "Six eggs"
print(shoppingList)

shoppingList[3..<6] = ["Bananas", "Apples"]
print(shoppingList)

shoppingList.insert("aaa", at: 1)
print(shoppingList)

shoppingList.remove(at: 0)
print(shoppingList)
let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList, mapleSyrup)

let apple = shoppingList.removeFirst()
print(shoppingList, apple)

let apples = shoppingList.removeLast()
print(apples)

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("index: \(index) - value: \(value)")
}


// 2、集合

// 集合类型的哈希值
// 集合内存储的元素必须可以哈希化

var letters = Set<Character>()
print("letters is \(letters)")
letters.insert("a")
print("letters is \(letters)")
letters = []
print("letters is \(letters)")

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print("favoriteGenres: \(favoriteGenres)")
print("I have \(favoriteGenres.count) favorite music genres.")

favoriteGenres.isEmpty ? print("As far as music goes, I'm not picky.") : print("I have particular music preferences.")

favoriteGenres.insert("Jazz")
print("favoriteGenres: \(favoriteGenres)")

favoriteGenres.remove("Rock")
print("favoriteGenres: \(favoriteGenres)")

favoriteGenres.contains("Jazz") ? print("I get up on the good foot.") : print("It's too funky in here.")

for gener in favoriteGenres {
    print("favoriteGenres contains:\(gener)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

let 和 = oddDigits.union(evenDigits).sorted()
print("集合的和：\(和)")

let 交 = oddDigits.intersection(evenDigits).sorted()
print("集合的交：\(交)")

let 差 = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
print("集合的差：\(差)")

let 并集减去交集 = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
print("集合的并集减去交集：\(并集减去交集)")

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print("house 是否是 farm 的子集： \(houseAnimals.isSubset(of: farmAnimals))")
print("farm 是否是 house 的父集： \(farmAnimals.isSuperset(of: houseAnimals))")
print("house 是否是 farm 的子集，并且两个集合并不相等： \(houseAnimals.isStrictSubset(of: farmAnimals))")
print("farm 是否是 house 的父集，并且两个集合并不相等： \(farmAnimals.isStrictSuperset(of: houseAnimals))")
print("farm 和 city 是否没有交集： \(farmAnimals.isDisjoint(with: cityAnimals))")


// 3、字典
var namesOfIntegers = [Int : String]()
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)

//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("The dictionary of airports contains \(airports.count) items.")

airports.isEmpty ? print("The airports dictionary is empty.") : print("The airports dictionary is not empty.")

airports["LHR"] = "London"
print(airports)

// updateValue 返回值是原来的值
if let oldValue = airports.updateValue("aaaaa", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
print(airports)

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

// remove 返回之前的值
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
print(airports)

for (key, value) in airports {
    print("key is \(key), value is \(value)")
}

for airportCode in airports.keys {
    print("key is : \(airportCode)")
}

for airportName in airports.values {
    print("value is : \(airportName)")
}

// 取出 key 和 value
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
print("keys is \(airportCodes), value is \(airportNames)")
