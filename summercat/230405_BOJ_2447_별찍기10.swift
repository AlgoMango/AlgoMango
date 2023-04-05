let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: "*", count: n), count: n)

func recur(_ size: Int, _ r: Int, _ c: Int) {
//  print(size, r, c)
  if size == 3 {
    map[r + 1][c + 1] = " "
    return
  }
  
  let secondR = r + size / 3
  let secondC = c + size / 3
  let thirdR = r + 2 * size / 3
  let thirdC = c + 2 * size / 3
  for i in secondR..<thirdR {
    for j in secondC..<thirdC {
      map[i][j] = " "
    }
  }
  recur(size / 3, r, c)
  recur(size / 3, r, secondC)
  recur(size / 3, r, thirdC)
  recur(size / 3, secondR, c)
  recur(size / 3, secondR, thirdC)
  recur(size / 3, thirdR, c)
  recur(size / 3, thirdR, secondC)
  recur(size / 3, thirdR, thirdC)
}

recur(n, 0, 0)

for i in 0..<n {
  print(map[i].joined())
}
