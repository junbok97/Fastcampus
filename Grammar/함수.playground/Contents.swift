import UIKit

// func함수명(파라미터 이름: 데이터 타입) -> 반환 타입{return  반환 값}
func sum(a: Int, b: Int) -> Int {
    return a+b
}

sum(a: 5, b: 3)

func hello() -> String {
    return "hello"
}
hello()

// 반환타입이 없는 함수
func printName() {
    print("이준복")
}


// 매개변수는 있지만 반환타입은 없는 함수
// 기본값을 가지는 매개변수
func greeting(friend: String, me: String = "junbok"){
    print("Hello, \(friend)! I'm \(me)")
}

greeting(friend: "Albert")
greeting(friend: "Albert", me: "lee")


/*
 func 함수 이름(<전달인자 레이블> <매개변수 이름>: <매개변수 타입>, <전달인자 레이블> <매개변수 이름>: <매개변수 타입>...) -> <반환타입>{
 return 반환 값
}
*/

// 외부 매개변수 지정
func sendMessage(from myName:String, to name:String) -> String {
    return "Hello \(name)! I'm \(myName)"
}

sendMessage(from: "Junbok", to: "Json")

func sendMessage(_ name: String) -> String {
    return "Hello \(name)!"
}
sendMessage("이준복")

// 내부 매개변수 지정, 외부 매개변수 X
func sendMessage(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}

sendMessage(me: "junbok", friends: "Json", "Albert", "Stella")


// 함수의 반환값과 튜플
func getIndvInfo() -> (Int, String) {
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, name)
}


func getUserInfo() -> (Int, Character, String) {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, gender, name)
}

var uInfo = getUserInfo()
uInfo.0
uInfo.1
uInfo.2

var (a,b,c) = getUserInfo()
a
b
c

var (height, _, name) = getUserInfo()

func getUserInfo2() -> (h: Int, g: Character, n: String) {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, gender, name)
}

let uinfo2 = getUserInfo2()
uinfo2.h
uinfo2.g
uinfo2.n

typealias infoResult = (Int, Character, String)

func getUserInfo3() -> infoResult {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, gender, name)
}

let uinfo3 = getUserInfo3()
uinfo3.0
uinfo3.1
uinfo3.2

typealias infoResult2 = (h:Int, g:Character, n:String)

func getUserInfo4() -> infoResult2 {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, gender, name)
}

let uinfo4 = getUserInfo4()
uinfo4.h
uinfo4.g
uinfo4.n


/*
 func 함수이름(<외부 매개변수명> <내부 매개변수명>: <타입>, <외부 매개변수명> <내부 매개변수명>: <타입>, ...) -> <반환타입> {
        함수 코드
 }
 */

// printHello(name:msg:)
func printHello(name: String, msg: String){
    print("\(name)님, \(msg)")
}
printHello(name: "홍길동", msg: "안녕하세요")


// printHello2(to:welcomeMessage:)
func printHello2(to name:String, welcomeMessage msg: String) {
    print("\(name)님, \(msg)")
}

// printHello3(to:msg:)
func printHello3(to name:String, msg: String) {
    print("\(name)님, \(msg)")
}


func printHello4(to name:String, _ msg: String) {
    print("\(name)님, \(msg)")
}
printHello4(to: "홍길동", "안녕하세요")

func printHello5(_ name:String, _ msg: String) {
    print("\(name)님, \(msg)")
}
printHello5("홍길동", "안녕하세요")


// 가변 인자
// func 함수 이름(매개변수명: 매개변수 타입 ...)
func avg(score: Int...) -> Double {
    var total = 0
    for r in score {
        total += r
    }
    return (Double(total) / Double(score.count))
}

print(avg(score: 10,20,30,40))


// 기본값을 가지는 매개변수
//func 함수 이름(매개변수: 매개변수 타입 = 기본값)
func echo(message: String, newline: Bool = true){
    if newline == true {
        print(message, true)
    } else {
        print(message, false)
    }
}

echo(message: "안녕하세요")
echo(message: "안녕하세요", newline: true)
echo(message: "안녕하세요", newline: false)

func incrementBy(base: Int)  -> Int {
    var base = base
    base += 1
    return base
}

func descAge(name: String, _ paramAge: Int) -> String {
    var name = name
    var paramAge = paramAge
    
    name = name + "씨"
    paramAge += 1
    return "\(name)의 내년 나이는 \(paramAge)세입니다."
}

descAge(name: "준복", 25)


// ------ call by value ------------
func autoIncrement(value: Int) -> Int {
    var value = value
    value += 1
    return value
}

var cnt = 30
print(autoIncrement(value: cnt))
print(cnt)

// -------- call by reference -------------
func foo(paramCount: inout Int) -> Int {
    paramCount += 1
    return paramCount
}

var count = 30
print(foo(paramCount: &count))
print(count)


// 변수의 생명주기
/*do{
    do{
        var ccnt = 3
        ccnt += 1
        print(ccnt)
    }
    ccnt += 1
    print(ccnt)
}*/

do{
    var ccnt = 3
    do{
        ccnt += 1
        print(ccnt)
    }
    ccnt += 1
    print(ccnt)
}


count = 30
func foo1() -> Int {
    count += 1
    return count
}
foo1() // 31

count = 30
func foo2(count: Int) -> Int {
    var count = count
    count += 1
    return count
}

print(foo2(count: count)) // 함수 내부의 count 변수값 : 31
print(count) // 외부에서 정의된 count 변수값 : 30



// --------- 일급 함수 -----------------

func foo3(base: Int) -> String {
    return "결과값은 \(base + 1)입니다."
}

let fn1 = foo3(base: 5) // "결과값은 6입니다."

let fn2 = foo3 // fn2 상수에 foo3 함수가 할당됨
fn2(5) // "결과값은 6입니다."

/*func foo3(base: Int) -> String {
    print("함수 foo3가 실행됩니다.") // 코드 추가
    return "결과값은 \(base + 1)입니다."
}*/

let fn3 = foo3(base: 5) // "함수 foo3가 실행됩니다." "결과값은 6입니다."

let fn4 = foo3 // 출력결과 없음

// 변수나 상수에 함수를 대입할 때에는 함수가 실행되는 것이 아니라 함수라는 객체 자체만 대입된다.
// 변수나 상수에 함수를 대입하면 함수타입을 가진다.
// 함수타입은 Input과 output만 필요
// (인자타입1, 인자타입2, ...) -> 반환타입
// 반환타입이 없으면 Void라고 명시

// 함수 타입 : (Int) -> String
func boo(age: Int) -> String {
    return "\(age)"
}

let fn: (Int) -> String = boo

// 함수 타입 : (Int, String) -> String
func boo(age:Int, name: String) -> String {
    return "\(name)의 나이는 \(age)세 입니다."
}

let s1: (Int, String) -> String = boo
let s2: (Int, String) -> String = boo(age:name:)

// boo - 함수의 이름
// boo(age:name) - 함수의 식별자

// let t = boo  <- 어느 boo인지 알 수 없음 boo(age:) or boo(age:name:)

// 타입 어노테이션을 명시
let t01: (Int) -> String = boo // boo(age:)
let t02: (Int, String) -> String = boo // boo(age:name:)

// 함수의 식별값을 명시
let fn01 = boo(age:)
let fn02 = boo(age:name:)

// 타입 어노테이션으로 불가능한 경우 식별자도 작성
func boo2(age:Int, name: String) -> String {
    return "\(name)의 나이는 \(age)세 입니다."
}
func boo2(height:Int, nick: String) -> String {
    return "\(nick)의 키는 \(height)입니다."
}

// let fn03: (Int, String) -> String = boo2 <- boo2(age:name:) or boo2(height:nick:) ?
// let fn04: (Int, String) -> String = boo2 <- boo2(age:name:) or boo2(height:nick:) ?
let fn03: (Int, String) -> String = boo2(age:name:)
let fn04: (Int, String) -> String = boo2(height:nick:)


// 인자값과 반한값이 있는 경우
// 함수 타입 : (Int, String) -> (String, Int)
func foo(age: Int, name: String) -> (String, Int) {
    return (name, age)
}

// 인자값이 없는 경우
// 함수 타입 : () -> String
func foo() -> String {
    return "Empty Values"
}

// 반환값이 없는 경우
// 함수 타입 : (Int) -> ()
func boo(base: Int) {
    print("param = \(base)")
}

// 인자값 반환값 모두 없는 경우
// 함수 타입 : () -> ()
func too() {
    print("empty values")
}

public typealias Void = ()
// Int -> () == (Int) -> Void
// () -> () == () -> Void


// -------------  함수의 반환타입으로 함수를 사용 가능 --------------
func desc() -> String {
    return "this is desc()"
}

// 반환 타입 : () -> String
func pass() -> () -> String {
    return desc
}

let p = pass()
p() // "this is desc()"


func plus(a: Int, b: Int) -> Int {
    return a + b
}
func minus(a: Int, b: Int) -> Int {
    return a - b
}
func times(a: Int, b: Int) -> Int {
    return a * b
}
func divide(a: Int, b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    return a / b
}

func calc(_ operand: String) -> (Int, Int) -> Int {
    switch operand {
    case "+" :
        return plus(a:b:)
    case "-" :
        return minus(a:b:)
    case "*" :
        return times(a:b:)
    case "/" :
        return divide(a:b:)
    default :
        return plus(a:b:)
    }
}

let c1 = calc("+")
c1(3,4)

calc("+")(3,4)

let c2 = calc("-")
c2(3,4)

let c3 = calc("*")
c3(3,4)

let c4 = calc("/")
c4(3,4)



// 함수의 인자값으로 함수를 사용 가능
func incr(param: Int) -> Int {
    return param + 1
}

func broker(base: Int, function fn: (Int) -> Int) -> Int {
    return fn(base)
}

broker(base: 3, function: incr(param:))

func successThrough() {
    print("연산 처리가 성공했습니다.")
}
func failThrough() {
    print("처리 과정에 오류가 발생하였습니다.")
}
func divid(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
    guard base != 0 else {
        fCallBack()
        return 0
    }
    
    defer {
        sCallBack()
    }
    return 100 / base
}

divid(base: 30, success: successThrough, fail: failThrough)


// 익명함수 클로저(Closure) == 람다
divid(base: 30, success: {
    () -> Void in
    print("연산 처리가 성공했습니다.")
}, fail: {
    () -> Void in
    print("처리 과정에 오류가 발생하였습니다.")
})


// 함수의 중첩

// 외부함수
func outer(base: Int) -> String {
    // 내부함수
    func inner(inc: Int) -> String {
        return "\(inc)를 반환합니다."
    }
    let result = inner(inc: base + 1)
    return result
}
outer(base: 3)


func outer(param: Int) -> (Int) -> String {
    
    func inner(inc: Int) -> String {
        return "\(inc)를 반환합니다."
    }
    
    return inner(inc:)
}

let n1 = outer(param:  3)
let n2 = n1(30)


func basic(param: Int) -> (Int) -> Int {
    let value = param + 20
    
    func append(add: Int) -> Int {
        return value + add
    }
    
    return append(add:)
}

let result = basic(param: 10)
result(10)

let result1 = basic(param: 10)
/*
 result1 에 할당된 클로저
 func appebnd(add: Int) -> Int {
    return 30 + add
 }
 */
let result2 = basic(param: 5)
/*
 result2 에 할당된 클로저
 func appebnd(add: Int) -> Int {
    return 25 + add
 }
 */


let clo = { (s1: Int, s2: String) -> Void in
    print("s1:\(s1), s2:\(s2)")
}
clo(1, "closure")

var value = [1,9,5,7,3,2]
func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}
value.sort(by: order(s1:s2:))

value.sort(by: {
    (s1: Int, s2: Int) -> Bool in
    if s1 > s2 {
        return true
    } else {
        return false
    }
})
value.sort(by: {(s1:Int, s2: Int) -> Bool in return s1 > s2})
value.sort(by: {(s1:Int, s2: Int) in return s1 > s2})
value.sort(by: {s1, s2 in return s1 > s2})
value.sort(by: {$0 > $1})
value.sort(by: >)

// 트레일링 클로저
// 함수의 마지막 인자값이 클로저일 때 이를 인자값 형식으로 작성하는 대신 함수의 뒤에 꼬리처럼 붙일 수 있는 문법
value.sort() { (s1, s2) in
    return s1 > s2
}
value.sort { (s1, s2) in
    return s1 > s2
}
