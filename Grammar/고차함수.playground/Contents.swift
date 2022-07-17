import UIKit

// map
let numbers = [0,1,2,3]
let mapArray = numbers.map { (number) -> Int in
    return number * 2
}
print("map \(mapArray)")

let mapArray2 = numbers.map{
    
        $0 + 2
    
}

// compactMap
// 닐 값 제거
let numbers2 = [1,2,3,4,5,nil,6,nil,8]
let cm = numbers2.compactMap { $0 }
cm

// faltmap
let numbers3 = [[1,2,3],[4,5,6]]
let flatNum = numbers3.flatMap { $0 }
flatNum


// filter
let intArray = [10,5,20,13,4]
let filterArray = intArray.filter { $0 > 5}
print("filter \(filterArray)")


// reduce
let someArray = [1,2,3,4,5]
let reduceResult = someArray.reduce(0) {
    (result: Int, element: Int) -> Int in
    print("\(result) + \(element)")
    return result + element
}

print("reduce \(reduceResult)")
