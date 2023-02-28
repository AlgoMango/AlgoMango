let cases = Int(readLine()!)!

func solve(_ arr: [Character]) {
  var parentheses = arr
  var stack: [Character] = []
  var idx: Int = arr.count - 1
  
  while idx >= 0 {
    if parentheses[idx] == ")" {
      stack.append(parentheses[idx])
      idx -= 1
      continue
    } else {
      if stack.isEmpty { break }
      stack.removeLast()
      idx -= 1
    }
  }
  
  if idx == -1 && stack.isEmpty { print("YES") }
  else { print("NO") }
}

for _ in 1...cases {
  let input = Array(readLine()!)
  solve(input)
}
