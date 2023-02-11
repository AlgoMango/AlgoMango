import Foundation
//여러 줄 입력, wholeNumberValue 사용

let firstInput = Int(readLine()!)!
let secondInput = Int(readLine()!)!
let thirdInput = Int(readLine()!)!
let calculationResult = [firstInput, secondInput, thirdInput].reduce(1) { $0 * $1 }
var result = Array(repeating: 0, count: 10)

calculationResult.description.forEach {
    result[$0.wholeNumberValue!] += 1
}

result.forEach {
    print($0)
}
