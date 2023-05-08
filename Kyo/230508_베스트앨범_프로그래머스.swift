//230508_베스트앨범_프로그래머스

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genresDict: [String:Int] = [:]
    
    for index in 0..<genres.count {
        genresDict[genres[index]] =  (genresDict[genres[index]] ?? 0) + plays[index]
    }
    
    var sortedGDict = genresDict.sorted { first, second in 
        return first.value > second.value
    }
    
    var answer: [Int] = []
    
    for gen in sortedGDict {
        var temp: [(Int, Int)] = []
        for index in 0..<genres.count {
            if gen.key == genres[index] {
                temp.append((plays[index], index))
            }
        }
        
        temp.sort { first, second in
            return first.0 > second.0
        }
            
        if temp.count > 1 {
            answer += [temp[0].1, temp[1].1]
        } else {
            answer += [temp[0].1]
        }
    }
    
    return answer
}
