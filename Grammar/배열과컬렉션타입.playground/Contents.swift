import UIKit

// Array, Dictionary, Set

// --------- Array --------------
// 순서 O 중복 O

// var numbers: Array<Int> = Array<Int>()
// var numbers: Array<Int> = []
// var numbers: [Int] = []
// var numbers: [Int] = Array<Int>()
// var numbers = [Int]()
var numbers = Array<Int>()

numbers.append(1)
numbers.append(2)
numbers.append(3)

var alphabet = ["a","b","c","d","e","f"]
alphabet[0...2]
alphabet[2...3]
alphabet[1..<3]
alphabet[1...2] = ["1","2","3"]
alphabet[2...4] = ["A"]


// ------------- Dictionary --------------------
// Dictionary<key, value>
// key값은 중복 X

// var dic: Dictionary<String, Int> = Dictionary<String, Int>()
// var dic: [String: Int] = [:]
var dic: [String: Int] = ["이준복" : 1]
dic["김철수"] = 3
dic["김민지"] = 5
dic

dic["김민지"] = 6
let dic2 = dic.values.sorted()
dic2
dic.removeValue(forKey: "김민지")
dic


// -------------- Set ---------------
// 순서 X 중복허용 X

// set은 축약형 X
var set: Set = Set<Int>()
set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30)
set.insert(30)
set

set.remove(20)
set

var genres : Set = ["Classic", "Rock", "Balad"]
genres.insert("Jazz")
genres.insert("Rock")
genres.insert("Rock")

print("\(genres.remove("Jazz"))")
// set.contains(element)
// set에 element가 있냐
print("\(genres.contains("Rock"))")

if genres.contains("Rock"){
    print("Rock 아이템이 저장되어 있습니다.")
} else {
    print("Rcok 아이템이 저장되어 있지 않습니다.")
}


if let removedItem = genres.remove("Rock"){
    print("아이템 \(removedItem)의 삭제가 완료되었습니다.")
} else {
    print("삭제할 값이 집합에 추가되어 있지 않습니다.")
}

genres.removeAll()

if genres.isEmpty {
    print("모든 아이템이 삭제되었습니다.")
} else {
    print("아직 \(genres.count)개의 아이템이 남아있습니다.")
}

var oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let primeDigits: Set = [2,3,5,7]

oddDigits.intersection(evenDigits).sorted()
oddDigits.symmetricDifference(primeDigits).sorted()
oddDigits.union(evenDigits).sorted()

oddDigits.subtract(primeDigits)
oddDigits.sorted()


struct Task {
    var title: String
    var done: Bool
}

var tasks = [Task]()


var task = Task(title: "1", done: true)
tasks.append(task)
task = Task(title: "2", done: true)
tasks.append(task)
task = Task(title: "3", done: true)
tasks.append(task)
task = Task(title: "4", done: true)
tasks.append(task)
task = Task(title: "5", done: true)
tasks.append(task)


// map 함수는 배열의 각 요소에 대하여 매개변수로 주어지는 클로져를 실행하여 새로운 배열을 리턴
let x = [1,2,3,4,5,6]
let y = x.map { (number: Int) -> Int in  // (매개변수) -> 반환값
    let result = 3 * number
    return result
}
y

let z = x.map {
    return $0 * 5
}

z
