let cases = Int(readLine()!)!
var answer: Int = 0

// ABBAABAABA
// ABBA

func solve() {
  let input: [Character] = Array(readLine()!)
  var result = removeDuplicates(input)
  if result.isEmpty {
    answer += 1
    return
  }
  
  // stack = [ABBA]
  result = removeDuplicates(result)
  if result.isEmpty {
    answer += 1
    return
  }
}

func removeDuplicates(_ arr: [Character]) -> [Character] {
  var input = arr
  var stack: [Character] = []
  
  while !input.isEmpty {
    let cur = input.last!
    
    if stack.isEmpty {
      stack.append(input.removeLast())
      continue
    }
    
    if stack.last! == cur {
      input.removeLast()
      stack.removeLast()
      continue
    } else {
      stack.append(input.removeLast())
      continue
    }
  }
  
  return stack
}

for _ in 1...cases {
  solve()
}

print(answer)
