import UIKit
import Foundation

/*
 { (매개변수) -> 리턴 타입 in
    실행 구문
 }
*/

let hello = { () -> () in
    print("hello")
}

hello()


let hello2 = { (name: String) -> String in
    return "Hello, \(name)"
}

hello2("Junbok")


func doSomething(closure: () -> ()){
    closure()
}


doSomething(closure: { () -> () in
    print("hello1")
})

doSomething() {
    print("hello2")
}

doSomething {
    print("hello3")
}

func doSomething2() -> () -> () {
    return { () -> () in
        print("hello4")
    }
}

doSomething2()()

func doSomething2(success: () -> (), fail: () -> ()) {
    
}

doSomething2 {
    <#code#>
} fail: {
    <#code#>
}

func doSomething3(closure: (Int, Int, Int) -> Int) {
    closure(5,2,3)
}

doSomething3(closure: {(a,b,c) in
    return a+b+c
})

doSomething3(closure: {
    return $0 + $1 + $2
})

doSomething3(closure: {
    $0 + $1 + $2
})

doSomething3(){
    $0 + $1 + $2
}

doSomething3{
    $0 + $1 + $2
}


// fucntion
func myScore(a: Int) -> String {
    return "\(a)점"
}

let score = myScore
score(50)


// closure
let myScore2 = { (a: Int) -> String in
    return "\(a)점"
}
myScore2(20)

// 축약
// logic이 한줄일 경우 return 생략 가능
let myScore3 = { (a: Int) -> String in
    "\(a)점"
}
myScore3(2)

// return 값으로 타입추론가능 return 형태 생략가능
let myScore4 = { (a: Int) in
    "\(a)점" // == return "\(a)점"
}
myScore4(2)

// 타입 명시적으로 지정
let myAge: Int = 20
// 타입추론
let myAge2 = 20

let myScore5: (Int) -> String = { a in
    "\(a)점"
}
myScore5(20)

let myScore6: (Int, Int) -> String = { a, b in
    "\(a + b)점"
}
myScore6(20,30)

// 받는 파라미터 생략가능
// 파라미터 default name $0
let myScore7: (Int) -> String = {
    "\($0)점"
}
myScore7(20)

// Closure 실전
let names = ["apple", "air", "brown", "red", "orange", "blue", "candy", "hobby"]

// 조건 -> 찾는다 -> 특정한 글자가 포함된 것을 찾는다.
let containsSomeText: (String, String) -> Bool = { name, find in
    if name.contains(find) {
        return true
    }
    
    return false
}

// 조건 -> 찾는다 -> 입력한 글자로 시작하는 첫글자를 찾는다
let isStartSomeText: (String, String) -> Bool = { name, find in
    // description은 string으로 바꿔줌
    if name.first?.description == find {
        return true
    }
    return false
}

func find(findString: String, condition: (String, String) -> Bool) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if condition(name,findString) {
            newNames.append(name)
        }
    }
    
    return newNames
}

find(findString: "a", condition: containsSomeText)
find(findString: "a", condition: isStartSomeText)

func someFind(find: String) -> [String] {
    var newNames = [String]()
    for name in names {
        if name.contains(find){ // find글자가 있으면 저장
            newNames.append(name)
        }
    }
    
    return newNames
}
someFind(find: "a")

var names2 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// sort return 없음 원본 변경
names2.sort()



// sorted return 있음 원본 변경 X
let names3 = names2.sorted()

