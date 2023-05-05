//230505_피로도_프로그래머스
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
