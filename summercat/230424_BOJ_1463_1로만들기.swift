let n = Int(readLine()!)!
let max = 1_000_005

func solve() {
  var history = Array(repeating: 0, count: max)
  
  if n == 1 {
    print(0)
    return
  }
  
  for i in 2...n {
    history[i] = history[i - 1] + 1
    if i % 2 == 0 { history[i] = min(history[i], history[i / 2] + 1) }
    if i % 3 == 0 { history[i] = min(history[i], history[i / 3] + 1) }
  }
  
  print(history[n])
}

solve()
