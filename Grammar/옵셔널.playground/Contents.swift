import UIKit

// Optionals (옵셔널)
// 값이 있을수도 있고, 없을수도 있다.
// 값이 있다
// 값이 없다 -> nil

var myAge: Int? = 0
myAge = nil

// 값이 없는 상태 체크 -> 틀린 로직 (Swift 언어 스팩)
// 컴퓨터 언어에서는 잘 못된것
// 값이 없는것이 아닌 0이란 값을 가진 것

if myAge == 0 {
    // alert - 나이를 입력해 주세요.
}

if myAge == nil {
    // alert - 나이를 입력해 주세요.
}

var myName: String? = "" // 빈스트링
// myName이 비어있는게 아니라 빈스트링 값이 들어가 있는것
// 값이 없는 상태
if myName == "" {
    // 이름을 입력해주세요.
}

if myName == nil {
    // 이름값이 없음
}

// 옵셔널 그냥 사용할 수 없는 경우가 많이 있음.
var a: Int? = 10
var b: Int? = 20


// coalesce
// a가 nil이면 0
// b가 nil이면 1
var c = (a ?? 0) + (b ?? 1)

// force unwrap 강제해제
// 무조건 값이 있다 즉 nil이 무조건 아니다
// nil일때 에러 발생
var d = a! + b!

// if Statements
// if var
// if let

if a != nil {
    print(a!)
}

//if var hasNumber = a {
//    hasNumber = hasNumber * 2
//    print(hasNumber)
//}

// guard let
// guard var
// guard 문으로 optional을 해제해주면 다른곳에서도 사용가능
func testFunc() {
    guard let hasNumber = a else { return }
    print(hasNumber)
}

testFunc()


// 옵셔널 타입으로 변수나 상수를 선언했을 때 초깃값을 넣지 않으면 자동적으로 nil
// 포장되어 있는 옵셔널변수는 일반타입 변수와 결합과 연산 불가능
var name: String?

var optionalName: String? = "Junbok"
print(optionalName)

// 명시적 해제
var requiredName: String = optionalName!

// 명시적 해제 강제 해제
// 값이 nil이라면 오류발생
var num: Int?
print(num)
//print(num!)

// 비강제 해재
if let result = num {
    print(result)
}

func test() {
    let number: Int? = 5
    guard let result = number else { return }
    print(result)
}

test()

// 묵시적 해제 - 컴파일러
// 옵셔널 값은 비교연산자를 이용해 다른 값과 비교하면 컴파일러가 자동으로 옵셔널을 해제
let value: Int? = 6
if value == 6{
    print("value가 6입니다.")
} else {
    print("value가 6이 아닙니다.")
}

// 묵시적 옵셔널 해제
// 사용할 때 해제
let string = "12"
var stringToInt: Int! = Int(string)
print(stringToInt)



// 옵셔널 체이닝

struct Developer {
    let name: String
}


struct Company{
    let name: String
    var developer: Developer?
}


var devloper = Developer(name: "lee")
var company = Company(name: "junbok", developer: devloper)
print(company.developer)
print(company.developer?.name)
print(company.developer!.name)



