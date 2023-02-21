//230221_프린터(스택,큐)_프로그래머스
import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var documents: [(Int, Int)] = []
    
    for (index, number) in priorities.enumerated() {
        documents.append((index, number))
    }
    
    var maxPrior = priorities.sorted(by: >)
    var cnt = 0
    
    while true {
        if maxPrior.first! == documents.first!.1 {
            if location == documents.first!.0 {
                cnt += 1
                return cnt
            } else {
                documents.removeFirst()
                maxPrior.removeFirst()
                cnt += 1
            }
        } else {
            documents.append(documents.removeFirst())
        }
    }
}
