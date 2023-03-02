let n = Int(readLine()!)!
var map: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

let k = Int(readLine()!)!

if k != 0 {
  for _ in 1...k {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let row = input[0] - 1
    let col = input[1] - 1
    
    map[row][col] = 1
  }
}

// 머리 방향을 알려주는 변수 필요함
// 처음은 오른쪽을 보고 있다
// 회전이 왼쪽(L)인 경우 +1, 오른쪽(D)인 경우 -1
var dir: Int = 0 // 오른쪽을 보고있으면
let dr = [0, -1, 0, 1] // row는 변하지 않고
let dc = [1, 0, -1, 0] // col + 1

// 뱀의 몸통이 있던 위치를 기억하는 배열
var body: [(row: Int, col: Int)] = []
// 뱀의 위치를 -1로 표시
map[0][0] = -1
body.append((0, 0))
// 뱀이 앞으로 움직였을 때 지워야 할 위치의 인덱스
var removeIdx: Int = 0
// 뱀 대가리의 현재 위치
var r: Int = 0
var c: Int = 0
let l = Int(readLine()!)!
var answer: Int = 0

func solve() {
  for _ in 1...l {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let time: Int = Int(input[0])!
    let command: String = input[1]
    
    // 이동
    while answer < time {
      answer += 1
      let boom = move(r, c)
      if boom { return }
    }
    
    // 회전
    rotate(command)
  }
  
  // 회전 명령 끝난 이후 이동(전진)
  while true {
    answer += 1
    let boom = move(r, c)
    if boom { return }
  }
}

solve()
print(answer)

func rotate(_ char: String) {
  // 왼쪽으로
  if char == "L" {
    if dir == 3 { dir = 0 }
    else { dir += 1 }
  }
  // 오른쪽으로
  if char == "D" {
    if dir == 0 { dir = 3 }
    else { dir -= 1 }
  }
}

func move(_ row: Int, _ col: Int) -> Bool {
  let nr = row + dr[dir]
  let nc = col + dc[dir]
  
  // row나 col 값 중에 하나라도 안맞으면 터지는거
  if nr < 0 || nr >= n || nc < 0 || nc >= n { return true }
  if map[nr][nc] == -1 { return true }
  
  if map[nr][nc] == 1 {
    map[nr][nc] = -1
    body.append((nr, nc))
    r = nr
    c = nc
  } else {
    map[nr][nc] = -1
    body.append((nr, nc))
    let remove = body[removeIdx]
    map[remove.row][remove.col] = 0
    removeIdx += 1
    r = nr
    c = nc
  }
  return false
}
