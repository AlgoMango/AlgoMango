//https://www.acmicpc.net/problem/2178

/*
 문제이해

 N×M크기의 배열의 미로
 미로에서 1은 이동가능O 칸을 나타내고, 0은 이동불가X 칸을 나타낸다.
 한 칸에서 다른 칸으로 이동할 때, 서로 인접한 칸으로만 이동할 수 있다.
 1    0    1    1    1    1
 1    0    1    0    1    0
 1    0    1    0    1    1
 1    1    1    0    1    1  => (1,1)에서 15칸을 지나야 (N, M)의 위치로 이동할 수 있다.(시작, 도착 위치도 포함)

 (1, 1)에서 출발하여 (N, M)의 위치로 이동할 때 지나야 하는 최소의 칸 수를 구하라(항상 도착가능한 경우만 주어짐)

 입력.     ->  출력
 4 6          15
 101111
 101010
 101011
 111011
 --------------------------------------------------------------------------------
 풀이

 bfs: 꼭 bfs여야함 (dfs 노노)
 stack에 모두 담되, 한칸움직일때마다 +1 씩이므로 count도 같이 담아준다
 그리고 stack에서 꺼낼때 count를 꺼낸 count로 바꿔준다.

 만약 dfs인 LIFO 작업이라면 초반 두번 움직인게 담겨서 밀려밀려 못나오다가 10번 움직인뒤에 나와서
 count가 2로 바뀌는 상황이 생길 수 있기때문 꼭 FIFO작업으로 해야한다

 주의 N*M에 도착을 확인하는 조건이 필요하다.
 주어진 예제 4번처럼
 이런 예처럼 도착한 뒤에도 stack에 담길 수 있기 떄문이다.
 */

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let length = input[0]
let width = input[1]
var miro: [[Int]] = []

for _ in 0..<length {
    let input: [Int] = readLine()!.map { Int(String($0))! }
    miro.append(input)
}

let xMove: [Int] = [0, 0, 1, -1]
let yMove: [Int] = [1, -1, 0, 0]

var count: Int = 0
var stack: [(x: Int, y: Int, count: Int)] = [(x: 0, y: 0, count: count)] // count같이 담아주기
miro[0][0] = 0

while !stack.isEmpty {
    let last = stack.removeFirst()
    let xy: (x: Int, y: Int) = (last.x, last.y)
    count = last.count
    count += 1

    if last.x == length - 1 && last.y == width - 1 { // N * M칸에 도착했으면 프린트하고 끝내기
        print(count)
        exit(0)
    }

    for index in 0..<4 {
        let x2 = xy.x + xMove[index]
        let y2 = xy.y + yMove[index]

        if x2 < length && x2 >= 0 && y2 < width && y2 >= 0 && miro[x2][y2] == 1 {
            stack.append((x: x2, y: y2, count: count))
            miro[x2][y2] = 0
        }
    }
}

print(count)
