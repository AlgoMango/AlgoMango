//
// 프로그래머스: 프린터
// 🔗: https://school.programmers.co.kr/learn/courses/30/lessons/42587?language=swift

/*
정녕 이게 최선인가..
*/


import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var location = location
    var priorities = priorities
    var outputCount = 0

    while true {
        if priorities.first! < priorities.max()! {
            priorities.append(priorities.removeFirst())
            if location == 0 {
                location = priorities.count - 1
                continue
            }
            location -= 1
            continue
        }
        
        if priorities.first! == priorities.max() && location == 0 {
            outputCount += 1
            location -= 1
            break
        }
        
        if priorities.first! == priorities.max() {
            priorities.removeFirst()
            outputCount += 1
            location -= 1
        }
        
    }
    return outputCount
}
