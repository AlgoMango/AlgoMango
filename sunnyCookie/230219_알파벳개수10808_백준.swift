//https://www.acmicpc.net/problem/2164

// 1️⃣ flag와 다른 stack 두 개로 사용(하나는 reversed해서 removeLast를 사용할 수 있도록함) ➡️ 68ms
import Foundation

var reversedNumbers: [Int] = Array(1...Int(readLine()!)!).reversed()
var removeFlag: Bool = true
var numbers: [Int] = []

if reversedNumbers.count == 1 {
    print(1)
    exit(0)
}

while true {
    if removeFlag {
        reversedNumbers.removeLast()
    } else {
        numbers.append(reversedNumbers.removeLast())
    }

    if reversedNumbers.count == 0 && numbers.count == 1 {
        print(numbers.last!)
        break
    } else if reversedNumbers.count == 1 && numbers.count == 0 {
        print(reversedNumbers.last!)
        break
    } else if reversedNumbers.count == 0 {
        reversedNumbers = numbers.reversed()
        numbers = []
    }

    removeFlag = !removeFlag
}

/*
-----------------------------------------------------------------------------
*/

// 2️⃣ 위 방법에서 입력값이 짝수/홀수로 [2,4,6...] 으로 시작하도록 수정  ➡️ 48ms

import Foundation

let number = Int(readLine()!)!
var reversedNumbers: [Int] = []
var removeFlag: Bool = true
var numbers: [Int] = []

if number == 1 {
    print(1)
    exit(0)
}

if number % 2 == 0 {
    for num in stride(from: number, through: 1, by: -2) {
        reversedNumbers.append(num)
    }
} else {
    for num in stride(from: number - 1, through: 1, by: -2) {
        reversedNumbers.append(num)
    }

    removeFlag = false
}

while true {
    if reversedNumbers.count == 0 && numbers.count == 1 {
        print(numbers.last!)
        break
    } else if reversedNumbers.count == 1 && numbers.count == 0 {
        print(reversedNumbers.last!)
        break
    } else if reversedNumbers.count == 0 {
        reversedNumbers = numbers.reversed()
        numbers = []
    }

    if removeFlag {
        reversedNumbers.removeLast()
    } else {
        numbers.append(reversedNumbers.removeLast())
    }

    removeFlag = !removeFlag
}

/*
-----------------------------------------------------------------------------
*/

// 3️⃣ index를 상수로 갖고, 삭제할 때 삭제 대신 값을 0으로 만드는 방법 ➡️ 48ms
// 삭제없이 계속 append되므로 Array값이 너무 커지는 단점이 있는 것 같음

import Foundation

var numbers: [Int] = Array(1...Int(readLine()!)!)
var index: Int = 0

if numbers.count == 1 {
    print(1)
    exit(0)
}

while true {
    numbers[index] = 0
    numbers.append(numbers[index + 1])
    numbers[index + 1] = 0

    if numbers[numbers.count - 2] == 0 {
        print(numbers.last!)
        break
    }

    index += 2
}


