import Foundation

//이전 인덱스를 알아야 하고, 배열 크기와 비교해서 인덱스 조정

let input = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
var numbers = Array(1...input.first!)
var result = [Int]()
var index = input[1]

while !numbers.isEmpty {
    if index <= numbers.count {
        result.append(numbers.remove(at: index - 1))
        index = index - 1 + input[1]
    } else {
        index -= numbers.count
    }
}

print("<", terminator: "")
print(result.map { String($0) }.joined(separator: ", "), terminator: "")
print(">")
