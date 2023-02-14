// https://www.acmicpc.net/problem/2577

import Foundation

let a = readLine()!
let b = readLine()!
let c = readLine()!

let multipliedABC = Int(a)! * Int(b)! * Int(c)! 
var result = Array(repeating: 0, count: 10)

for index in String(multipliedABC) {
    result[Int(String(index))!] += 1
}

result.forEach { number in
    print(number)
}

//Character -> Int 형변환시 String으로 형변환 후 가능 Character -> String -> Int
