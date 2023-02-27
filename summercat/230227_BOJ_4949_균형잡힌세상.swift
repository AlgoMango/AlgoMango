func solve(_ str: String) {
  let characters: [Character] = Array(str)
  var arr: [Character] = []
  
  for char in characters {
    if isLetter(char) { continue }
    else { arr.append(char) }
  }
  
  var stack: [Character] = []
  
  while !arr.isEmpty {
    let cur = arr.last!
    
    if !isOpen(cur) {
      arr.removeLast()
      stack.append(cur)
      continue
    }
    
    if isOpen(cur) {
      if stack.isEmpty { break }
      if cur == "(" && stack.last! == ")" {
        arr.removeLast()
        stack.removeLast()
        continue
      }
      if cur == "[" && stack.last! == "]" {
        arr.removeLast()
        stack.removeLast()
        continue
      }
      break
    }
  }
  
  if arr.isEmpty && stack.isEmpty { print("yes") }
  else { print("no") }
}

func isLetter(_ char: Character) -> Bool {
  if char == "(" || char == ")" || char == "[" || char == "]" { return false }
  return true
}

func isOpen(_ char: Character) -> Bool {
  if char == "(" || char == "[" { return true }
  return false
}

while true {
  let input = readLine()!
  if input == "." { break }
  solve(input)
}
