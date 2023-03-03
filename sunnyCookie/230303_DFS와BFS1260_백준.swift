// https://www.acmicpc.net/problem/1260

/*
문제이해

그래프를 DFS로 탐색한 결과와 BFS로 탐색한 결과를 출력하는 프로그램을 작성.
(방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문한다. 정점 번호는 1번부터 N번까지이다.)

첫째 줄 입력: 정점개수 N(1 ≤ N ≤ 1,000), 간선개수 M(1 ≤ M ≤ 10,000), 탐색을 시작할 정점번호 V
둘째 줄부터는 간선개수 M만큼 간선이 연결하는 두 정점의 번호들이 주어진다.(주어지는 간선은 양방향이다.)

첫째 줄에 DFS를 수행한 결과를, 그 다음 줄에는 BFS를 수행한 결과를 출력한다.

-------------------------------------------------------------------------------------
*/

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let nodeCount: Int = input[0]
let branchCount: Int = input[1]
let startNode: Int = input[2]
var branchedNode: [[Int]] = Array(repeating: [], count: nodeCount + 1) // [[], [], [], [], []] index랑 Vlaue랑 맞추려고 + 1해서 만듬

for _ in 1...branchCount {
    let branch: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    branchedNode[branch[0]].append(branch[1])
    branchedNode[branch[1]].append(branch[0])  // 양방향이므로 모두 담음
}

// DFS -> LIFO
branchedNode = branchedNode.map { $0.sorted(by: >) } //LIFO이므로 정점 번호가 더 작은 것을 먼저 방문하기 위해서 내림차순으로 정렬하고 시작한다.

var visited: [Int] = []
var needVisit: [Int] = [startNode]

while !needVisit.isEmpty {
    let last = needVisit.removeLast()

    if visited.contains(last) {
        continue
    }

    visited.append(last)
    needVisit += branchedNode[last]
}

print(visited.map { String($0) }.joined(separator: " "))

// BFS -> FIFO
branchedNode = branchedNode.map { $0.sorted(by: <) } //FIFO이므로 정점 번호가 더 작은 것을 먼저 방문하기 위해서 오름차순으로 정렬하고 시작한다.

visited = []
needVisit = [startNode]

while !needVisit.isEmpty {
    let first = needVisit.removeFirst()

    if visited.contains(first) {
        continue
    }

    visited.append(first)
    needVisit += branchedNode[first]
}

print(visited.map { String($0) }.joined(separator: " "))
