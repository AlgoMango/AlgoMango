// https://www.acmicpc.net/problem/9012

// 1️⃣ replacingOccurrences 사용 => 28ms

let count: Int = Int(readLine()!)!

for _ in 1...count {
    var input: String = readLine()!

    while true {
       input = input.replacingOccurrences(of: "()", with: "")

        if !input.contains("()") {
            break
        }
    }

    input.count == 0 ? print("YES") : print("NO")
}


/*
------------------------------------------------------------------------
*/

// 2️⃣ Stack 이용 ==> 8ms 

import Foundation

let count: Int = Int(readLine()!)!

for _ in 1...count {
    let input: [Character] = Array(readLine()!)
    var stack: [Character] = []

    for index in 0..<input.count {
        if input[index] == "(" {
            stack.append("(")
        } else  {
            if stack.isEmpty {
                print("NO")
                break
            } else {
                stack.removeLast()
            }
        }

        if index == input.count - 1 && stack.isEmpty {
            print("YES")
        } else if index == input.count - 1 {
            print("NO")
        }
    }
}
