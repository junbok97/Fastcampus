//import UIKit
//
//// 열거형에 멤버만 있을 경우
//enum Diretion {
//    case north
//    case south
//    case east
//    case west
//}
//
//var diretionToHead = Diretion.east
//diretionToHead = .west
//print(diretionToHead)
//
//// 열거형에 멤버와 값이 있을 경우
//enum CompassPoint: String {
//    case north = "북"
//    case south = "남"
//    case east = "동"
//    case west = "서"
//}
//
//// var diretion: CompassPoint = CompassPoint.east
//// var diretion: CompassPoint = .east
//var diretion = CompassPoint.east
//diretion = .west
//
//switch diretion {
//case .north:
//    print(diretion.rawValue)
//case .south:
//    print(diretion.rawValue)
//case .east:
//    print(diretion.rawValue)
//case .west:
//    print(diretion)
//    print(diretion.rawValue)
//}
//
//let diretion2 = CompassPoint(rawValue: "남")
//
//// 열거형에 멤버와 값, 연관값이 있는 경우
//enum PhoneError {
//    case unknown
//    case batteryLow(String)
//}
//
//let error = PhoneError.batteryLow("배터리가 곧 방전됩니다.")
//
//
//switch error {
//case .batteryLow(let message):
//    print(message)
//case .unknown:
//    print("알 수 없는 에러입니다.")
//}
//
//enum HTTPCode: Int {
//    case OK = 200
//    case NOT_MODIFY = 304
//    case INCORRECT_PAGE = 404
//    case SEVER_ERROR = 500
//}
//
//HTTPCode.OK.rawValue // 200
//HTTPCode.NOT_MODIFY // NOT_MODIFY
//HTTPCode.NOT_MODIFY.rawValue // 304
//HTTPCode.INCORRECT_PAGE.rawValue // 404
//HTTPCode.SEVER_ERROR.rawValue // 500
//
//
//enum Rank: Int {
//    case one = 1
//    case two, three, four, five
//}
//
//Rank.one.rawValue // 1
//Rank.two.rawValue // 2
//Rank.three.rawValue // 3
//Rank.four.rawValue // 4
//Rank.five.rawValue // 5
//
//
//enum Rank2: Int {
//    case one = 10
//    case two = 20
//    case three, four, five
//}
//
//Rank2.one.rawValue // 10
//Rank2.two.rawValue // 20
//Rank2.three.rawValue // 21
//Rank2.four.rawValue // 22
//Rank2.five.rawValue // 23
//
//// 연관 값은 세부적으로 구분하기 위한 용도 이외에도 실행 시점에서 값을 저장해야 할 필요가 있을 때 사용
//enum ImageFormat {
//    case JPEG
//    case PNG(Bool)
//    case GIF(Int, Bool)
//}
//
//var newImage = ImageFormat.PNG(true)
//newImage = .GIF(256, false)
//
//
//enum HTTPCode2: Int {
//    case OK = 200
//    case NOT_MODIFY = 304
//    case INCORRECT_PAGE = 404
//    case SEVER_ERROR = 500
//
//    var value: String {
//        return "HTTPCode number is \(self.rawValue)"
//    }
//
//    func getDescription() -> String {
//        switch self {
//        case .OK :
//            return "응답이 성공했습니다. HTTP 코드는 \(self.rawValue)입니다."
//        case .NOT_MODIFY :
//            return "변경된 내역이 없습니다. HTTP 코드는 \(self.rawValue)입니다."
//        case .INCORRECT_PAGE :
//            return "존재하지 않는 페이지 입니다. HTTP 코드는 \(self.rawValue)입니다."
//        case .SEVER_ERROR :
//            return "서버 오류입니다. HTTP 코드는 \(self.rawValue)입니다."
//        }
//    }
//
//    static func getName() -> String {
//        return "This Enumeration is HTTPCode"
//    }
//}
//var response = HTTPCode.OK
//
//
//
//struct Beer {
//    let id: Int?
//    let name,taglineString, description, brewersTips, imageURL: String?
//
//    enum CodingKeys: String, CodingKey  {
//        case id, name, description
//        case taglineString = "tagline"
//        case imageURL = "image_url"
//        case brewersTips = "brewers_tips"
//    }
//}
//
//let beer = Beer(id: 20, name: "a", taglineString: "B", description: "C", brewersTips: "D", imageURL: "E")
//
//enum Kind: Int {
//    case Todo = 0, Metting, Study, Etc
//    func toString() -> String {
//        switch self {
//            case .Todo: return "할일"
//            case .Metting: return "미팅"
//            case .Study: return "공부"
//            case .Etc : return "기타"
//        } // switch self
//    } // func toString()
//    static var count: Int {return Kind.Etc.rawValue + 1}
//} // enum Kind
//
//Kind(rawValue: 0)
//
//Kind.Todo.toString()
//Kind.Todo
//
//enum keys: String, CodingKey  {
//    case id, name, description
//    case taglineString = "tagline"
//    case imageURL = "image_url"
//    case brewersTips = "brewers_tips"
//}
//
//
//enum CommunityCategory: String, CaseIterable, Identifiable {
//    case academic = "ACADEMIC", club = "CLUB", hobby = "HOBBY", other = "OTHER"
//    var id: Self { self }
//
//    func type() -> String {
//        switch self {
//        case .academic:
//            return "학사"
//        case .club:
//            return "동아리"
//        case .hobby:
//            return "취미"
//        case .other:
//            return "기타"
//        }
//    }
//}

//enum listType {
//    case text,Image
//
//    func toString() -> String {
//        switch self {
//        case .text:
//            return "text"
//        case .Image:
//            return "Image"
//        }
//    }
//}
//
//enum te {
//    case base(listType)
//    case appNotice
//    case profile
//
//    func toString() -> String {
//        switch self {
//
//        case .base(let listType):
//            return listType.toString()
//        case .profile:
//            return "profile"
//        case .appNotice:
//            return "appNotice"
//        }
//    }
//
//    func text() {
//        switch self {
//        case .base(.Image):
//            print(2)
//        case .base(.text):
//            print(3)
//        default:
//            print(1)
//        }
//    }
//
//}
//
//listType.text.toString()
//let a = te.base(.Image)
//print(a.toString())
//a.text()
//




var a: Int? = 1

if let b = a {
    print(1)
} else {
    print(2)
}

var a = [String]()
print(a.count)

a += []

print(a.count)
