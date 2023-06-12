//20230612_피로도(2회차)_프로그래머스
import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    var allcase: [[Int]] = []
    var visit = Array(repeating: false, count: dungeons.count)
    
    // 던전 도는 총 case
    func foundAllCase(result: [Int]) {
        if result.count == dungeons.count {
            allcase.append(result)
            return
        }
        
        for index in 0..<dungeons.count {
            if visit[index] { continue }
            
            visit[index] = true
            foundAllCase(result: result + [index])
            visit[index] = false
        }
    }
    
    foundAllCase(result: [])
    
    var answer = 0
    for testCase in allcase {
        if answer == testCase.count { break }
        
        var tired = k
        var count = 0
        for sequence in testCase {
            if tired >= dungeons[sequence][0] {
                tired -= dungeons[sequence][1]
                count += 1
            }
        }
        
        answer = max(answer, count)
    }
    
    return answer
}
