import Foundation
//아스키코드 , reduce 활용

var array = Array(repeating: 0, count: 26)

input.forEach { character in
    let alphabetIndex = Int(UnicodeScalar(String(character))!.value) - Int(UnicodeScalar("a").value)

    array[alphabetIndex] += 1
}

var result = array.reduce("") {
    $0 + " " + String($1)
}
result.removeFirst()

print(result)
