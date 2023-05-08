//230508_피로도_프로그래머스_2회
import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    // 일단 모든 케이스 구하기 
    let allcase = foundAllCase(dungeons.count) 
    
    var answer = 0
    
    for testcase in allcase {
        var tempK = k
        var count = 0
        for seq in testcase {
            if tempK >= dungeons[seq][0] {
                tempK -= dungeons[seq][1]
                count += 1
            } 
        }
        
        // 모든 던전 가능한 케이스 구하는게 아니라 최대 돌수잇는 던전 갯수..
        answer = max(count, answer)
    }
    
    return answer
}

func foundAllCase(_ number: Int) -> [[Int]] {
    var result: [[Int]] = []
    
    var visit = Array(repeating: false, count: number)
    
    func recursive(temp: [Int]) {
        if temp.count == number {
            result.append(temp)
            return
        }
        
        for num in 0..<number {
            if visit[num] { continue }
            
            visit[num] = true
            var temp = temp
            temp.append(num)
            recursive(temp: temp)
            visit[num] = false
        }
    }
    
    recursive(temp: [])
    
    return result
}


import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    var allcase = foundAllCase(number: dungeons.count)
    var answer = 0
    var total = k
    
    for playCase in allcase {
        total = k
        var count = 0
        for number in playCase {
            if total >= dungeons[number][0] {
                total -= dungeons[number][1]
                count += 1
            } 
        }
        
        answer = max(answer, count)
    }
    
    return answer
}

func foundAllCase(number: Int) -> [[Int]] {
    
    var answer: [[Int]] = []
    var visit = Array(repeating: false, count: number)
    
    func recursive(temp: [Int]) {
        if temp.count == number {
            answer.append(temp)
            return
        }
        
        for num in 0..<number {
            if visit[num] { continue }
            
            visit[num] = true
            recursive(temp: temp + [num])
            visit[num] = false
        }
    }
    
    recursive(temp: [])
    return answer
}
