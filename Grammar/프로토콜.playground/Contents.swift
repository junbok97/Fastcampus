import Foundation
import Darwin

protocol SomeProtocol {
    
}

protocol SomeProtocol2{
    
}

struct SomeStructrue: SomeProtocol, SomeProtocol2 {
    
}


/*
 class SomeClass: SomeSuperClass, SomeProtocol, SomeProtocol2 {
 }
 
 */


protocol FirstProtocol {
    var name: Int {get set}
    var age: Int {get}
}

protocol AnotherProtocol {
    static var someTypeProperty: Int {get set}
}

protocol FullyNames {
    var fullName: String {get set}
    func printFullName()
}

struct Person: FullyNames {
    var fullName: String
    
    func printFullName() {
        print(fullName)
    }
}

protocol SomeProtocol3 {
    func someTypeMethod()
}

protocol SomeProtocol4 {
    init(someParameter: Int)
}

protocol SomeProtocol5{
    init()
}

class SomeClass: SomeProtocol5 {
    required init() {
        
    }
}


// 프로토콜에 선언되는 프로퍼티에는 초기값을 할당할 수 없음
// 연산 프로퍼티인지 저정 프로퍼티인지 구분 하지 않음
// 프로퍼티의 종류, 이름, 변수/상수 구분, 타입, 읽기 전용인지 읽고 쓰기가 가능한지에 대해서만 정의할 뿐
protocol SomePropertyProtocol {
    var name: String { get set }
    var description: String { get }
}

struct RubyMember: SomePropertyProtocol {
    var name = "홍길동"
    var description: String {
        return "Name : \(self.name)"
    }
}

protocol SomeMethodProtocol {
    func execute(cmd: String)
    func showPort(p: Int) -> String
}

protocol NewMethodProtocol {
    mutating func execute(cmd: String, desc: String)
    func showPort(p:Int, memo desc: String) -> String
}


struct RubyService: SomeMethodProtocol {
    func execute(cmd: String) {
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p)"
    }
}

protocol MService {
    mutating func execute(cmd: String)
    func showPort(p: Int) -> String
}

struct RubyMService: MService {
    var paramCommand: String?
    mutating func execute(cmd: String) {
        self.paramCommand = cmd
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}

struct RubyMService2: MService {
    var paramCommand: String?
    
    func execute(cmd: String) {
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}


class RubyThread: MService {
    var paramCommand: String?
    
    func execute(cmd: String) {
        self.paramCommand = cmd
        
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}
    

protocol SomeTypeProperty {
    static var defaultValue: String { get set }
    static func getDefaultvalue() -> String
}

struct TypeStruct: SomeTypeProperty {
    static var defaultValue = "default"
    static func getDefaultvalue() -> String {
        return defaultValue
    }
}

class ValueObject: SomeTypeProperty {
    static var defaultValue = "default"
    static func getDefaultvalue() -> String {
        return defaultValue
    }
}


// 프로토콜에서는 초기화 메소드도 정의 가능
// 메소드 정의 방법과 비슷
// 구현되는 초기화 메소드의 이름과 매개변수명은 프로토콜의 명세에 작성된 것과 완전히 일치해야 함
// 프로토콜 명세에 선언된 초기화 메소드는 그것이 기본 제공되는 초가화 메소드일지라도 직접 구현해야함
// 클래스에서 초기화 메소드를 구현할 때에는 반드시 required 키워드를 붙여야함
protocol SomeInitProtocol {
    init()
    init(cmd: String)
}

struct SInit: SomeInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = "start"
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
}

class CInit: SomeInitProtocol {
    var cmd: String
    
    required init() {
        self.cmd = "start"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
}



protocol Init {
    init()
    func getValue()
}

class Parent {
    
    func getValue() {
        
    }
    
    init() {
        
    }
}


// 클래스는 부모클래스가 제일 앞으로 그 뒤에 프로토콜 나열
// 초기화 메소드가 아니라면 override키워드만
class Child: Parent, Init {
    
    override required init() {
        <#code#>
    }
    
    override func getValue() {
        <#code#>
    }
}

z
struct MultiImplement: NewMethodProtocol, SomeInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = "start"
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
    
    mutating func execute(cmd: String, desc: String) {
        self.cmd = cmd
        if cmd == "start" {
            print("시작합니다.")
        }
    }
    
    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo : \(desc)"
    }

}


protocol Wheel {
    func spin()
    func hold()
}

class Bicycle: Wheel {
    var moveState = false
    
    func spin() {
        self.pedal()
    }
    
    func hold() {
        self.pullBreak()
    }
    
    func pedal() {
        self.moveState = true
    }
    
    func pullBreak() {
        self.moveState = false
    }
}

// Bicycle 클래스로 타입 추론
let trans = Bicycle()
trans.moveState
trans.pedal()
trans.pullBreak()
trans.spin()
trans.hold()

// Wheel 프로토콜로 타입 추론
let trans2: Wheel = Bicycle()
trans2.spin()
trans2.hold()


protocol A {
    func doA()
}

protocol B {
    func doB()
}

class Impl: A, B {
    func doA() {
        print("doA")
    }
    func doB() {
        print("doB")
    }
    
    func desc() -> String {
        return "Class instance method"
    }
}

// desc() 메소드 접근 불가능
var ipl: A & B = Impl()
ipl.doA()
ipl.doB()


// 델리게이션
protocol FuelPumpDelegate {
    func lackFuel()
    func fullFuel()
}

class FuelPump {
    var maxGage: Double = 100.0
    var delegate: FuelPumpDelegate? = nil
    
    var fuelGage: Double {
        didSet {
            if oldValue < 10 {
                // 연료가 부족해지면 델리게이트의 lackFuel 메소드를 호출한다.
                self.delegate?.lackFuel()
            } else if oldValue == self.maxGage {
                // 연료가 가득차면 델리게이트의 fullFuel 메소드를 호출한다.
                self.delegate?.fullFuel()
            }
        }
    }
    
    init(fuelGage: Double = 0) {
        self.fuelGage = fuelGage
    }
    
    // 연료펌프를 가동한다.
    func startPump() {
        while(true) {
            if(self.fuelGage > 0) {
                self.jetFuel()
            } else {
                break
            }
        }
    }
    
    
    // 연료를 엔진에 분사한다. 분사할 때마다 연료 게이지의 눈금은 내려간다.
    func jetFuel() {
        self.fuelGage -= 1
    }
    
}


class Car: FuelPumpDelegate {
    var fuelPump = FuelPump(fuelGage: 100)
    
    init() {
        self.fuelPump.delegate = self
    }
    
    func lackFuel() {
        // 연료를 보충한다.
    }
    
    func fullFuel() {
        // 연료 보충을 중단한다.
    }
    
    
    // 자동차에 시동을 겁니다.
    func start() {
        fuelPump.startPump()
    }
}



class Man {
    var name: String?
    
    init(name: String = "홍길동") {
        self.name = name
    }
}

protocol Job {
    func doWork()
}


extension Man: Job {
    func doWork() {
        print("\(self.name!)님이 일을 합니다.")
    }
}

let man = Man(name: "개발자")
man.doWork()


// 프로토콜의 상속
/*
protocol C: A, B {
    func doC()
}

 protocol C {
    doA()
    doB()
    doC()
 }
 */

// 프로토콜의 상속은 부모 프로토콜에서의 선언과 자식 프로토콜에서의 선언이 겹치더라도 클래스에서처럼 override 키워드를 붙여야 하는 제약이 없다.
protocol C: A, B {
    func doA()
    func doB()
    func doC()
}

class ABC: C {
    func doA() {
        
    }
    
    func doB() {
        
    }
    
    func doC() {
        
    }
}


let abc: C = ABC()
// abc.doA(), abc.doB(), abc.doC()


let a: A = ABC()
// a.doA()

let ab: A & B = ABC()
// ab.doA(), ab.doB()

let abc2: A & B & C = ABC()
// abc2.doA(), abc2.doB(), abc2.doC()

func foo(abc: C) { }
foo(abc: ABC())

func boo(abc: A & B) { }
boo(abc: ABC())

abc is C // true
abc is A & B // true
abc is A // true
abc is B // true
a is C // true
a is B // true
ab is C // true
abc2 is A & B & C // true


protocol Machine {
    func join()
}

protocol Wheel2: Machine {
    func lotate()
    
    init(name: String, currentSpeed: Double)
}

class Vehicle {
    var currendSpeed = 0.0
    var name = ""
    
    init(name: String, currentSpeed: Double) {
        self.name = name
        self.currendSpeed = currentSpeed
    }
}

class Car2: Vehicle, Wheel2 {
    required override init(name: String, currentSpeed: Double = 0.0) {
        super.init(name: name, currentSpeed: currentSpeed)
    }
    
    func join() {
        // join parts
    }
    
    func lotate() {
        print("\(self.name)의 바퀴가 회전합니다.")
    }
}

class Carpet: Vehicle, Machine {
    func join() {
        // join parts
    }
}

var translist = [Vehicle]()
translist.append(Car2(name: "자동차", currentSpeed: 10.0))
translist.append(Carpet(name: "양탄자", currentSpeed: 15.0))

for trans in translist {
    if let obj = trans as? Wheel2 {
        obj.lotate()
    } else {
        print("\(trans.name)의 하위 타입 변환이 실패했습니다.")
    }
}
 


// optional 키워드가 붙으면 구현하지 않아도 됨
@objc
protocol MsgDelegate {
    @objc optional func onReceive(new:Int)
}

class MsgCenter {
    var delegate: MsgDelegate?
    var newMsg: Int = 0
    
    func msgCheck() {
        if newMsg > 0 {
            self.delegate?.onReceive?(new: self.newMsg)
            self.newMsg = 0
        }
    }
}

class Watch: MsgDelegate {
    var msgCenter: MsgCenter?
    
    init(msgCenter: MsgCenter) {
        self.msgCenter = msgCenter
    }
    
    func onReceive(new: Int) {
        print("\(new) 건의 메시지가 도착했습니다.")
    }
}
