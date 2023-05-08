import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var number = n
    var temp: [Int] = String(n, radix: k).split(separator: "0").map { Int($0)! }
    var result = 0

    temp.forEach {
        if $0 != 1 {
            if isPrime(num: $0) {
                result += 1
            }
        }
    }

    return result
}

func isPrime(num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }

    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }

    return true
}
