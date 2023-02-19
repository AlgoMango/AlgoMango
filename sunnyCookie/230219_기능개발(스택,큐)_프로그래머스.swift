//https://school.programmers.co.kr/learn/courses/30/lessons/42586?language=swift
// 스택, 큐 이용

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var stack: [Int] = []
    var answer: [Int] = []

    for index in 0..<progresses.count {
        let days: Int = Int(ceil(Double(100 - progresses[index]) / Double(speeds[index])))

        if !stack.isEmpty && stack[0] < days {
            answer.append(stack.count)
            stack = []
        }

        stack.append(days)
    }

    if !stack.isEmpty {
        answer.append(stack.count)
    }

    return answer
}
