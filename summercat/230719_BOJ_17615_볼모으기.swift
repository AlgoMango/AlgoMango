// 참고 https://newdeal123.tistory.com/9

// n <= 500_000
let n: Int = Int(readLine()!)!
let balls: [Character] = Array(readLine()!)
var red: Int = 0
var blue: Int = 0
var answer: Int = 500_001
var str: String = ""

/*
 RBBRBRRR > BBBRRRRR
 
 빨강 옮길때, 파랑 옮길때 두 가지 케이스 다 하고 비교? -> 총 4가지 케이스
 빨강 옮겨서 빨/파 파/빨
 파랑 옮겨서 빨/파 파/빨
 */

for ball in balls {
    if ball == "R" { red += 1 }
    if ball == "B" { blue += 1 }
}

func solve() {
    var count: Int = 0
    var move: Int = 0
    // 빨강 옮기기 / 왼쪽에 빨강
    // 왼쪽 끝부터 있는 빨강 개수를 세고, 빨강이 아니게 되는 순간 스탑 -> red에서 센만큼 빼준게 빨강 이동 갯수
    for i in 0..<n {
        if balls[i] != "R" { break }
        count += 1
    }
    move = red - count
    answer = answer < move ? answer : move
    
    // 초기화
    count = 0
    move = 0
    
    // 빨강 옮기기 / 오른쪽에 빨강
    for i in (0..<n).reversed() {
        if balls[i] != "R" { break }
        count += 1
    }
    move = red - count
    answer = answer < move ? answer : move
    
    // 초기화
    count = 0
    move = 0
    
    for i in 0..<n {
        if balls[i] != "B" { break }
        count += 1
    }
    move = blue - count
    answer = answer < move ? answer : move
    
    // 초기화
    count = 0
    move = 0
    
    // 빨강 옮기기 / 오른쪽에 빨강
    for i in (0..<n).reversed() {
        if balls[i] != "B" { break }
        count += 1
    }
    move = blue - count
    answer = answer < move ? answer : move
    
    print(answer)
}

solve()
