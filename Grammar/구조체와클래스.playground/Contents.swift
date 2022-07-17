import UIKit


// 클래스는 초기값이 필요

struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}

class VideMode{
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    var res = Resolution()
    
    func desc() -> String {
        return "VideMode 클래스"
    }
}

let insRes = Resolution()
let insVMode = VideMode()
let width = insRes.width

print("insRes 인스턴스의 width 값은 \(width)입니다.")
print("insVMode 인스턴스의 width 값은 \(insVMode.res.width)입니다.")

insVMode.name = "Sample"
insVMode.res.width = 1280

print("\(insVMode.name!) 인스턴스의 width 값은 \(insVMode.res.width)입니다.")

var res = insVMode.res
res.width = 1280

// 구조체는 모든 프로퍼티의 값을 인자값으로 입력받아 초기화하는 기본 초기화 구문을 자동으로 제공
// 멤버와이즈 초기화 구문
let defaultRes = Resolution(width: 1024, height: 768)
print("width : \(defaultRes.width), height : \(defaultRes.height)")




// 구조체는 call by value
struct User{
    var nickname: String
    var age: Int
    
    func information() {
        print("\(nickname) \(age)")
    }
}

var user = User(nickname: "junbok", age: 25)
user.nickname
user.nickname = "albert"
user.nickname

user.information()

// 클래스는 call by reference
class Dog {
    var name: String = ""
    var age: Int = 0
    
    // 생성자
    init(){
        
    }
    
    func introduce(){
        print("name \(name) age \(age)")
    }
}

var dog = Dog()
dog.name = "CoCo"
dog.age = 3
dog.introduce()


class new_User {
    var nickname: String
    var age: Int
    
    init(nickname:String, age: Int){
        self.nickname = nickname
        self.age = age
    }
    
    init(age: Int){
        self.nickname = "junbok"
        self.age = age
    }
    
    // 소멸자
    deinit {
        print("deinit new_User")
    }
}

var user1 = new_User(nickname: "junbok", age: 25)
var user2 = new_User(age: 26)

var user3: new_User? = new_User(age: 25)
user3 = nil



// ---------------- 저장, 연산, 타입 프로퍼티 -------------------

struct Dog2 {
    // 저장 프로퍼티
    var name: String
    let gender: String
}

var dog2 = Dog2(name: "junbok", gender: "Male")
print(dog2)
dog2.name = "이준복"


// 구조체 벨류타입이라 인스턴스를 상수로 선언하면 내부 프로퍼티도 전부 상수로
let dog3 = Dog2(name: "junbok", gender: "Male")

class Cat {
    var name: String
    let gender: String
    
    init(name: String, gender: String){
        self.name = name
        self.gender = gender
    }
    
}

// 클래스는 참조타입이라 상수로 선언해도 값 변경 가능
let cat = Cat(name: "json", gender: "male")
cat.name = "junbok"
print(cat.name)


struct Stock {
    // 저장 프로퍼티
    var averagePrice: Int
    var quantiy: Int
    
    // 계산 프로퍼티
    var purchasePrice: Int {
        get{
            return averagePrice * quantiy
        }
        
        // 매개변수 이름이 없다면 newValue
        /*
         set(){
            averagePrice = newValue / quantiy
         }
         */
        set(newPrice){
            averagePrice = newPrice / quantiy
        }
    }
}

var stock = Stock(averagePrice: 2300, quantiy: 3)
print(stock)
stock.purchasePrice // get 호출
stock.purchasePrice = 3000 // set호출
stock.purchasePrice


// 프로퍼티 옵저버
class Account {
    var credit: Int = 0{
        willSet{
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        didSet{
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}


var account = Account()
account.credit = 1000

// 타입 프로퍼티 인스턴스 생성없이 객체 내에 프로퍼티에 접근가능
// 타입 프로퍼티 = 클래스 변수
struct SomeStructure {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int {
        return 1
    }
}

SomeStructure.computedTypeProperty
SomeStructure.storedTypeProperty
SomeStructure.storedTypeProperty = "hello"
SomeStructure.storedTypeProperty



// ---------------- 상속 ---------------

/*
 class 클래스 이름 : 부모클래스 이름 {
    하위 클래스 정의
 
 }
*/

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        print("speaker on")
    }
}


class Bicycle: Vehicle {
    var hasBasket = false
}


var bicycle = Bicycle()
bicycle.currentSpeed
bicycle.currentSpeed = 15.0
bicycle.currentSpeed

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("choo choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " int gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 30.0
car.gear = 2
print(car.description)


class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")


// 지연 저장 프로퍼티
class OnCreate {
    init() {
        print("OnCreate!!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = OnCreate()
    
    init() {
        print("Lazy Test")
    }
}

let lz = LazyTest()
lz.late

// 저장 프로퍼티
class PropertyInit {
    // 저장 프로퍼티 - 인스턴스 생성시 최초 한번만 실행
    var value01: String! = {
        print("value01 excute")
        return "value01"
    }()
    // 저장 프로퍼티 - 인스턴스 생성시 최초 한번만 실행
    var value02: String! = {
        print("value02 excute")
        return "value02"
    }()
    // 저장 프로퍼티 - 인스턴스 생성시 최초 한번만 실행
    lazy var value03: String! = {
        print("value03 excute")
        return "value03"
    }()
}


let s = PropertyInit() // value01 excute value02 excute

s.value01 // 실행결과 없음
s.value02 // 실행결과 없음
s.value03 // 최초 실행 value03 excute
s.value03 // 실행결과 없음


// 연산 프로퍼티
/*
 class/struct/enum 객체명 {
    ...
    var 프로퍼티명 : 타입 {
        get {
            필요한 연산 과정
            reutrn 반환값
        }
        set(매개변수명) { // 생략가능
            필요한 연산구문
        }
    }
 }
 */


struct UserInfo {
    // 저장 프로퍼티 : 태어난 연도
    var birth: Int!
    
    // 연산 프로퍼티 : 올해가 몇년도인지 계산
    var thisYear: Int!{
        get{
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
    
    // 연산 프로퍼티 : 올해 - 태어난 연도 + 1
    var age: Int {
        get {
            return (self.thisYear - self.birth) + 1
        }
    }
}

let info = UserInfo(birth: 1980)
print(info.age)


struct Rect {
    // 사각형이 위치한 기준 좌표(좌측 상단 기준)
    var originX: Double = 0.0, originY: Double = 0.0
    
    // 가로 세로 길이
    var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
    
    // 사각형의 X 좌표 중심
    var centerX: Double {
        get {
            return self.originX + (self.sizeWidth / 2)
        }
        set(newCenterX) {
            originX = newCenterX - (self.sizeWidth / 2)
        }
    }
    
    // 사각형의 Y 좌표 중심
    var centerY: Double {
        get {
            return self.originY + (self.sizeHeight / 2)
        }
        set(newCenterY) {
            originY = newCenterY - (self.sizeHeight / 2)
        }
    }
}

var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
print("square.centerX = \(square.centerX), suqare.centerY = \(square.centerY)")


struct Position {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Rect2 {
    
    var origin = Position()
    var size = Size()
    
    var center: Position {
        get {
            let centerX = self.origin.x + (self.size.width / 2)
            let centerY = self.origin.y + (self.size.height / 2)
            return Position(x: centerX, y: centerY)
        }
        set(newCenter) {
            self.origin.x = newCenter.x - (self.size.width / 2)
            self.origin.y = newCenter.y - (self.size.height / 2)
        }
    }
    
    /*
    // 읽기 전용 속성으로 정의된 center 프로퍼티
    var center: Position {
        get {
            let centerX = self.origin.x + (self.size.width / 2)
            let centerY = self.origin.y + (self.size.height / 2)
            return Position(x: centerX, y: centerY)
        }
    }
    
     var center: Position {
        let centerX = self.origin.x + (self.size.width / 2)
        let centerY = self.origin.y + (self.size.height / 2)
        return Position(x: centerX, y: centerY)
     }
     */
}

/*
struct Rect {
    
    var origin = Position()
    var size = Size()
    
    func getCenter() -> Position {
        let centerX = self.origin.x + (self.size.width / 2)
        let centerY = self.origin.y + (self.size.height / 2)
        return Position(x: centerX, y: centerY)
    }
    mutating func setCenter(newCenter : Position) {
        self.origin.x = newCenter.x - (self.size.width / 2)
        self.origin.y = newCenter.y - (self.size.height / 2)
    }
    
 
}*/
 


let postion = Position(x: 0.0, y: 0.0)
let size = Size(width: 10.0, height: 10.0)

var square2 = Rect2(origin: postion, size: size)
print("square2.centerX = \(square2.center.x), suqare2.centerY = \(square2.center.y)")
square2.center = Position(x: 20.0, y: 20.0)
print("square2.centerX = \(square2.center.x), suqare2.centerY = \(square2.center.y)")



// weak는 참조카운트 카운트 하지 않음
// 순환참조 방지
class Game {
    var score = 0
    var name = ""
    var round: Round?
    
    init() {
        print("game init")
    }
    
    deinit {
        print("game deinit")
    }
}

class Round {
    weak var gameInfo: Game?
    var lastRound = 10
    var roundTime = 20
    deinit {
        print("Round deinit")
    }
}

var game: Game? = Game()
var round: Round? = Round()

game?.round = round
round?.gameInfo = game

struct CreditCard: Codable {
    let id: Int
    let rank: Int
    let name: String
    let cardImageURL: String
    let promotionDetail: PromotionDetail
    let isSelected: Bool?
}

struct PromotionDetail: Codable {
    let companyName: String
    let period: String
    let amount: Int
    let condition: String
    let benefitCondition: String
    let benefitDetail: String
    let benefitDate: String
}


struct CreditCardDummy {
    static let card0 = CreditCard(id: 0, rank: 1, name: "신한카드", cardImageURL: "https://www.shinhancard.com/_ICSFiles/afieldfile/2019/04/26/190426_pc_mrlife_cardplate600x380.png", promotionDetail: PromotionDetail(companyName: "신한", period: "2023.01.07(목)~2023.01.31(토)", amount: 13, condition: "온라인 채널을 통해 이벤트 카드를 보유하고, 혜택조건을 충족하신 분", benefitCondition: "이벤트 카드로 결제한 금액이 합해서 10만원이상 결제", benefitDetail: "현금 10만원", benefitDate: "2023.03.01(월)이후"), isSelected: nil)
    static let card1 = CreditCard(id: 1, rank: 2, name: "taptap S", cardImageURL: "https://static11.samsungcard.com/wcms/scard/personal/__icsFiles/afieldfile/2019/06/12/AAP1482_s.png", promotionDetail: PromotionDetail(companyName: "삼성", period: "2023.01.07(목)~2023.01.31(토)", amount: 12, condition: "온라인 채널을 통해 이벤트 카드를 보유하고, 혜택조건을 충족하신 분", benefitCondition: "이벤트 카드로 결제한 금액이 합해서 10만원이상 결제", benefitDetail: "포인트 10만원", benefitDate: "2023.03.01(월)이후"), isSelected: nil)
    static let card2 = CreditCard(id: 2, rank: 3, name: "KB국민 톡톡", cardImageURL: "https://img1.kbcard.com/ST/img/cxc/kbcard/upload/img/product/09223.png", promotionDetail: PromotionDetail(companyName: "KB국민", period: "2023.01.07(목)~2023.01.31(토)", amount: 13, condition: "온라인 채널을 통해 대상카드를 보유하신 분", benefitCondition: "이벤트 카드로 10만원 이상 이용 ", benefitDetail: "현금 10만원", benefitDate: "2023.03.01(월)이후"), isSelected: nil)
    static let card3 = CreditCard(id: 3, rank: 4, name: "올바른 FLEX 카드", cardImageURL: "https://card.nonghyup.com/content/imgs/shopmall/pro_img/card/F10043.png", promotionDetail: PromotionDetail(companyName: "농협", period: "2023.01.07(목)~2023.01.31(토)", amount: 10, condition: "온라인 채널을 통해 이벤트 카드를 보유하고, 이벤트에 응모하신 분", benefitCondition: "이벤트 대상 카드로 누적 10만원 이상 이용", benefitDetail: "현금 10만원", benefitDate: "2023.03.01(월)이후"), isSelected: nil)
    static let card4 = CreditCard(id: 4, rank: 5, name: "신한카드 Deep Dream", cardImageURL: "https://www.shinhancard.com/pconts/images/contents/card/plate/cdCreaditBJABE3.png", promotionDetail: PromotionDetail(companyName: "신한", period: "2023.01.07(목)~2023.01.31(토)", amount: 7, condition: "해당카드 보유회원", benefitCondition: "해당 카드로 결제기간동안 합산 8만원 이상 결제", benefitDetail: "포인트 8만원", benefitDate: "2023.04.01(목)이후"), isSelected: nil)
    static let card5 = CreditCard(id: 5, rank: 6, name: "우리 카드의 정석 POINT", cardImageURL: "https://pc.wooricard.com/webcontent/cdPrdImgFileList/2020/6/30/15a0b20b-f685-4155-a9bf-5e71674ab674.png", promotionDetail: PromotionDetail(companyName: "우리", period: "2023.01.07(목)~2023.01.31(토)", amount: 4, condition: "온라인 채널을 통해 이벤트 카드를 받은 고객 중 이벤트에 응모하신 분", benefitCondition: "이벤트 카드로 결제한 금액이 합해서 10만원이상", benefitDetail: "현금 8만원", benefitDate: "2023.03.01(월)이후"), isSelected: nil)
    static let card6 = CreditCard(id: 6, rank: 7, name: "NEW 씨티 클리어 카드", cardImageURL: "https://www.citibank.co.kr/download/cms/card/master/070045_8.png", promotionDetail: PromotionDetail(companyName: "씨티", period: "2023.01.07(목)~2023.01.31(토)", amount: 7, condition: "온라인 채널을 통해 이벤트 카드를 보유하고, 혜택조건을 충족하신 분", benefitCondition: "이벤트 카드로 결제한 금액이 합해서 10만원이상 이용 (1인 1회한)", benefitDetail: "7만원 캐시백", benefitDate: "2023.03.01(월)이후"), isSelected: nil)
    static let card7 = CreditCard(id: 7, rank: 8, name: "하나 클럽SK 카드", cardImageURL: "https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/03496.png", promotionDetail: PromotionDetail(companyName: "하나", period: "2023.01.07(목)~2023.01.31(토)", amount: 7, condition: "참여 기간 내 응모하고 이벤트 대상 카드 이용한 손님", benefitCondition: "이벤트 카드로 합산 7만원이상 결제", benefitDetail: "현금 7만원", benefitDate: "2023.03.01(월)이후"), isSelected: nil)
    static let card8 = CreditCard(id: 8, rank: 9, name: "LIKIT FUN+", cardImageURL: "https://image.lottecard.co.kr/UploadFiles/ecenterPath/cdInfo/ecenterCdInfoP12158-A12158_nm1_v.gif", promotionDetail: PromotionDetail(companyName: "롯데", period: "2023.01.07(목)~2023.01.31(토)", amount: 5, condition: "온라인 채널을 통해 이벤트 카드를 보유한 회원 중 아래 '이벤트 참여하기'를 통해 이벤트에 응모한 회원", benefitCondition: "이벤트 카드로 합산 5만원 이상 이용 시 5만원 캐시백(1인 1회)", benefitDetail: "현금 5만원", benefitDate: "2023.09.01(금)이전"), isSelected: nil)
    static let card9 = CreditCard(id: 9, rank: 10, name: "IBK 무민", cardImageURL: "https://www.bccard.com/images/individual/card/renew/list/card_100914.png", promotionDetail: PromotionDetail(companyName: "IBK기업은행", period: "2023.01.07(목)~2023.01.31(토)", amount: 5, condition: "온라인 채널을 통해 이벤트 카드를 보유하고, 혜택조건을 충족하신 분", benefitCondition: "이벤트 카드로 결제한 금액이 합해서 10만원이상 결제", benefitDetail: "포인트 5만원", benefitDate: "2023.03.01(월)이후"), isSelected: nil)
}


let cd = CreditCardDummy.card0

