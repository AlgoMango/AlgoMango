//https://school.programmers.co.kr/learn/courses/30/lessons/42587?language=swift

// 내풀이
// 주어진 우선순위배열(1)과, prioritie를 내림차순으로 만든 배열(2)를 만들고 각 배열의 인덱스를 맡는 index, sortedIndex를 만든다음
// sortedIndex가 한바퀴 돌면서 "prioritie를 내림차순배열[sortedIndex] == 우선순위배열(1)[Index]" 같을떄까지 index를 +1씩 해주고, index가 범위가 넘어가면 0으로 바꿔줌
// 두 값이 같은값일 떄 answer배열의 index에 몇순위로 풀렸는지 (=sortedIndex)를 담는다

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var prior: [Int] = priorities
    var index: Int = 0

    var sortedPrior: [Int] = priorities.sorted(by: >)
    var sortedIndex: Int = 0

    var answer : [Int] = Array(repeating: 0, count: prior.count)

    while sortedIndex < prior.count {
        if prior[index] == sortedPrior[sortedIndex] {
            sortedPrior[sortedIndex] = 0
            answer[index] = sortedIndex
            sortedIndex += 1
            index += 1
        } else {
            index += 1
        }

        if index == prior.count {
            index = 0
        }
    }

    return answer[location] + 1
}

/*
------------------------------------------------------------------------
*/

// 다른사람의 풀이
// 배열을 끝까지 안돌고 location에 해당하는 값만 찾으면 break 걸기.
