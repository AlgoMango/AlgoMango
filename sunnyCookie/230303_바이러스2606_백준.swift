// https://www.acmicpc.net/problem/2606

/*
문제이해

한 컴퓨터가 바이러스에 걸리면 연결되어 있는 모든 컴퓨터도 바이러스에 걸리게 된다.

 예를 들어 7대의 컴퓨터가 연결되어있다. 1번 컴퓨터가 웜 바이러스에 걸리면 연결되어있는 2번과 5번 컴퓨터를 감염시키고
 또 여기에 연결되어있던 3번과 6번 컴퓨터까지 전파되어 2, 3, 5, 6 네 대의 컴퓨터가 바이러스에 걸리게 된다.

 컴퓨터의 수와 연결되어 있는 정보가 주어질 때, 1번 컴퓨터를 통해 웜 바이러스에 걸리게 되는 컴퓨터의 수를 출력하는 프로그램을 작성하시오.

 첫째 줄: 컴퓨터의 수(<= 100)가 주어진다.
 둘째 줄: 연결되어 있는 컴퓨터 쌍의 수가 주어진다.
 셋째 줄 부터는 컴퓨터 쌍의 수만큼 한 줄에 한 쌍씩 네트워크 상에서 직접 연결되어 있는 컴퓨터의 번호 쌍이 주어진다.

-------------------------------------------------------------------------------------
풀이
 DFS Stack (LIFO)
*/

import Foundation

let computerCount: Int = Int(readLine()!)!

guard computerCount != 0,
      computerCount != 1 else {
    print(0)
    exit(0)
}

let branchCount: Int = Int(readLine()!)!

var branched: [Int: [Int]] = [:]
var visited: [Bool] = Array(repeating: false, count: computerCount + 1)
var needVisitStack: [Int] = [1]
var count: Int = 0

for _ in 1...branchCount {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

    if branched[input[0]] == nil {
        branched[input[0]] = [input[1]]
    } else {

    }

    if branched[input[1]] == nil {.          //⭐️⭐️⭐️ 양방향이라 양쪽 딕셔너리에 넣어주기!
        branched[input[1]] = [input[0]]
    } else {
        branched[input[1]]?.append(input[0])
    }
}

while !needVisitStack.isEmpty {
    let computerNumber = needVisitStack.removeLast()

    if visited[computerNumber] {
        continue
    }

    count += 1
    visited[computerNumber] = true
    needVisitStack += branched[computerNumber] ?? []
}

print(count - 1)
