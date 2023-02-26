// 질문할것: 왜 작거나 같다여야만 하는지 잘 모르겠다...? 크거나 같다로 해도 같은 결과일거라고 생각했는데

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]

var arr: [Int] = Array(1...n)
var answer: Int = 0

let targets = readLine()!.split(separator: " ").compactMap { Int($0) }

for target in targets {
  if arr[0] == target { arr.removeFirst() }
  else {
    let idx = arr.firstIndex(of: target)!
    if idx <= arr.count / 2 {
      while arr[0] != target {
        arr.append(arr.removeFirst())
        answer += 1
      }
      arr.removeFirst()
    } else {
      while arr[0] != target {
        var new: [Int] = [arr.removeLast()]
        new.append(contentsOf: arr)
        arr = new
        answer += 1
      }
      arr.removeFirst()
    }
  }
}

print(answer)
