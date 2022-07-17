import Foundation

// 익스텐션은 이미 존재하는 클래스나 구조체 열거형 등의 객체에 새로운 기능을 추가하여 확장해주는 구문.
// 새로운 객체를 정의하는 것이 아니라 이미 존재하는 객체에 여러 가지 요소를 추가해준다는 점이 특징
// 자신의 독립적인 객체를 가지지 않고 다른 객체를 확장해줌
// 새로운 연산 프로퍼티 추가 가능
// 새로운 메소드 정의 가능
// 새로운 초기화 구문 추가 가능
// 기존 객체를 수정하지 않고 프로토콜 구현 가능
// 기존 객체에서 사용된 같은 메소드를 익스텐션에서 재정의하는 것은 불가능
/*
 extendsion SomeType {
    추가기능
    연산프로퍼티 추가가능 but 저장 프로퍼티, 옵저버 불가능
 }
*/

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

var number = 3
number.isOdd
number.isEven

extension Double {
    var km: Double { return self * 1_0000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0}
    var description: String {
        return "\(self)km는 \(self.km)m, \(self)cm는 \(self.cm)m, \(self)mm는 \(self.mm)입니다."
    }
    
}

2.km
5.5.cm
125.mm
7.0.description

// 언더바(_)는 자릿수를 구분해주기 위한 것
// 결과에 영향 없음
1_000 == 1000
1_00_0 == 100_0

extension String {
    func covertToInt() -> Int? {
        return Int(self)
    }
}

var String = "0"
String.covertToInt()

extension Int {
    func repeatRun(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

let d = 3
d.repeatRun(task: {
    print("반갑습니다!")
})
d.repeatRun{
    print("반갑습니다!")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var value = 3
value.square()

let value2 = 3
value2.square() // 자기자신을 변경해야하는데 let 이므로 에러

public class DataSync {
    public func save(_ value: Any, forKey: String) {
        
    }
    public func load(_ key: String) -> Any {
        
    }
    public func remove(_ key: String) {
        
    }
}

// MARK: - 프로토콜 mark 주석
extension DataSync {
    public func stringToDate(_ value: String) -> Date {
        
    }
    public func dateToString(_ value: Date) -> String {
        
    }
}
