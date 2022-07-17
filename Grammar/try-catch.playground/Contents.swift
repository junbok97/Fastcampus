import Foundation


enum PhoneError: Error{
    case unknown
    case batteryLow(batteryLevel: Int)
}


//throw PhoneError.batteryLow(batteryLevel: 20)


func checkPhoneBatteryStatus(batteryLevel:Int) throws -> String {
    guard batteryLevel != -1 else {throw PhoneError.unknown}
    guard batteryLevel >= 20 else {throw PhoneError.batteryLow(batteryLevel: 20)}
    return "배터리 상태가 정상입니다."
}


/*
 do {
    try 오류 발생 가능코드
 } catch 오류 패턴 {
    처리 코드
 }
*/


do {
    try checkPhoneBatteryStatus(batteryLevel: -10)
} catch PhoneError.unknown {
    print("알 수 없는 에러입니다.")
} catch PhoneError.batteryLow(let battryLevel) {
    print("배터리 전원 부족 남은 배터리 : \(battryLevel)%")
} catch {
    print("그 외 오류 발생 : \(error)")
}

let status = try? checkPhoneBatteryStatus(batteryLevel: 30)
print(status)


let status2 = try! checkPhoneBatteryStatus(batteryLevel: 30)
print(status2)
