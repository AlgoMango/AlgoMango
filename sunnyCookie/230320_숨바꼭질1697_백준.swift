//https://www.acmicpc.net/problem/1697

/*
 문제이해
 수빈이와 동생과 숨바꼭질 중, 수빈이는 현재 점 N(0 ≤ N ≤ 100,000)에 있고, 동생은 점 K(0 ≤ K ≤ 100,000)에 있다.
 수빈이는 걷거나 순간이동을 할 수 있다. 수빈이 위치가 X일 때 걷는다면 1초 후에 X-1 또는 X+1로 이동하고 순간이동하면 1초 후에 2*X의 위치로 이동한다.
 수빈이와 동생의 위치가 주어졌을 때, 수빈이가 동생을 찾을 수 있는 가장 빠른 시간이 몇 초 후인지 구하는 프로그램을 작성하시오.
 --------------------------------------------------------------------------------
 풀이
 연산의 3방향을 stack에 담음 ( 이 때, 넣었던 수는 빼기위해서 Bool로 이루어진 Array로 확인하고 넣음 )
 */

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var (subin, sister) = (input[0], input[1])

guard sister > subin else {  // 수빈과 동생 수가 같을때는 0출력, 동생수가 더 적을 때를 -1밖에못하니까 subin-sister 값 출력하고 끝내기
    print(subin - sister)
    exit(0)
}

var index: Int = 0
var stack: [(v: Int, c: Int)] = [(v: subin, c: 0)] // value, count
var visit: [Bool] = Array(repeating: false, count: sister * 3) // stack에 담기 전 담겸던건 빼고 담기

while index < stack.count {
    let (value, count) = (stack[index].v, stack[index].c)

    guard value + 1 != sister && value - 1 != sister && value * 2 != sister else {
        print(count + 1)
        exit(0)
    }

    var options: [(v: Int, c: Int)] = [(v: value + 1, c: count + 1),
                                       (v: value - 1, c: count + 1),
                                       (v: value * 2, c: count + 1)]

    options = options.filter { $0.v >= 0 && $0.v * 2 <= sister * 3 && !visit[$0.v] } // 필터링: 인덱스 벗어난거, 방문했던거 빼기
    options.forEach { visit[$0.v] = true } // visit 처리
    stack += options
    index += 1
}
