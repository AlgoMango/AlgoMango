import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var correctCount = 0
    var invisibleNumber = lottos.filter { $0 != 0 }
    var result: [Int] = []
    
    invisibleNumber.forEach {
        if win_nums.contains($0) {
            correctCount += 1
        }
    }
    
    let worstCount = correctCount
    let bestCount = correctCount + (win_nums.count - invisibleNumber.count)
    
    let worstRank = calculateRank(correct: worstCount)
    let bestRank = calculateRank(correct: bestCount)
    
    
    return [bestRank, worstRank]
}

func calculateRank(correct: Int) -> Int {
    switch correct {
    case 6:
        return 1
    case 5:
        return 2
    case 4:
        return 3
    case 3:
        return 4
    case 2:
        return 5
    default:
        return 6
    }
}
