import UIKit

/*
 루프상수는 실행블록 안에서만 사용가능
 루프상수는 구문이 반복될때마다 순회대상에 포함하는 아이템을 넘겨받아 저장해 샐행블록 내부에서 사용가능하게 해줌
 dic, arr, set, 문자열을 순회대상으로 사용 가능
 for 루프상수 in 순회대상{
  실행할 구문..
 }
 */

for i in 1...4{
    print(i)
}

let array = [1,2,3,4,5]

for i in array{
    print(i)
}

/*
 while 조건식{
  실행할 구문
 }
 조건식은 bool 타입
 */

var number = 5

while number < 10 {
    number += 1
}

number

var x = 6

// do while
repeat {
    x+=2
} while x < 5

print(x)

var hashtags: [String]? 

//var hash = ""
//for i in hashtags {
//    hash = "#\(i) " + hash
//}
//hashtags?.forEach {
//    hash = "#\($0) " + hash
//}

let has = { (hash: [String]?) -> String in
    var hashTags = ""
    hash?.forEach {
        hashTags = "#\($0) " + hashTags
    }
    return hashTags
}


has(hashtags)
