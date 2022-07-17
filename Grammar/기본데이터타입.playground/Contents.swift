import UIKit

// Int
var someInt: Int = -100
someInt = 100

// UInt
var someUInt: UInt = 200

// Float
var someFloat: Float = 1.1
someFloat = 1
print(someFloat)

// Double
var someDouble: Double = 1.1
someDouble = 1

// Bool
var someBool: Bool = true
someBool = false

// Character
// char형이나 string형 둘다 ""
var someCharater: Character = "가"
someCharater = "A"

// String
var someString: String = "안녕하세요"


let Hello = "Hi, I'm winny"
var messaage = Hello
print(messaage)

let poem = "계절이 지나가는 하늘에는 \n"
+ "가을로 가득 차 있습니다. \n"
+ "나는 아무 걱정도 없이 가슴 속의 별들을 \n"
+ "다 헬 듯 합니다."
print(poem)

let poem2 = """
계절이 지나가는 하늘에는
가을로 가득 차 있습니다.
나는 아무 걱정도 없이 가슴 속의 별들을
다 헬 듯 합니다.
"""
print(poem2)

// 타입추론
// 컴파일러가 자동으로 결정해줌
// Float, Double 1.0이 무슨타입일지 ?
// Charater, String "A"은 무슨타입일지 ?
// 스위프트는 주어진 값에 타입이 여러가지에 동시에 속하는 경우 더 넓은 범위의 타입으로 결정

var number = 10
print(number)

