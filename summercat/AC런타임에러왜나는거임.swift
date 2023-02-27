import Foundation

// R: 배열에 있는 수의 순서를 뒤집는다 (reverse)
// D: 첫 번째 수를 버린다 (removeFirst)

let t = Int(readLine()!)!

for _ in 1...t {
  let ac: [Character] = Array(readLine()!)
  let _ = Int(readLine()!)!
  var input = readLine()!
  input.removeFirst()
  input.removeLast()
  let numbers = input.split(separator: ",").compactMap{ Int($0) }
  solve(ac, numbers)
}

func solve(_ ac: [Character], _ numbers: [Int]) {
  var isReversed: Bool = false
  var start: Int = 0
  var end: Int = numbers.count - 1
  var answer = numbers

  for char in ac {
    if char == "R" {
      isReversed = !isReversed
    } else if char == "D" {
      if start > end {
        print("error")
        return
      }
      if isReversed {
        end -= 1
      } else {
        start += 1
      }
    }
  }

  answer = Array(answer[start...end])
  
  print("[", terminator: "")
  if isReversed {
    answer = answer.reversed()
    let str = answer.map{ String($0) }.joined(separator: ",")
    print(str, terminator: "")
  } else {
    let str = answer.map{ String($0) }.joined(separator: ",")
    print(str, terminator: "")
  }
  print("]")
}
