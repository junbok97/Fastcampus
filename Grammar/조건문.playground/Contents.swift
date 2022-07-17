import UIKit

let age = 19

if age < 19 {
    print("미성년자")
} else {
    print("성년자")
}

let animal = "cat"

if animal == "dog"{
    print("강아지 사료 주기")
} else if animal == "cat" {
    print("고양이 사료 주기")
} else {
    print("해당되는 동물 사료가 없음")
}

let color = "green"

switch color {
case "blue" :
    print("파란색 입니다.")
case "green" :
    print("초록색 입니다.")
case "yellow" :
    print("노란색 입니다.")
default:
    print("찾는 색상이 없습니다.")
}

let temperature = 30

switch temperature {
case -20...9:
    print("겨울 입니다.")
case 10...14:
    print("가을 입니다.")
case 15...25:
    print("봄 입니다.")
case 26...35:
    print("여름 입니다.")
default :
    print("이상 기후입니다.")
}

