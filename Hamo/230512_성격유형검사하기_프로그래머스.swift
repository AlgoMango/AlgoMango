import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let jipyos: [[String]] = [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]]
    var scores: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    var result = ""
    
    for index in 0..<survey.count {
        let 지표 = survey[index].map { String($0) }
        let first = 지표[0]
        let second = 지표[1]
        
        let score = choices[index] - 4
        
        if score < 0 {
            scores[first]! += abs(score)
        } else if score > 0 {
            scores[second]! += abs(score)
        }
    }
    
    for jipyo in jipyos {
        if scores[jipyo[0]]! < scores[jipyo[1]]! {
            result += jipyo[1]
        } else {
            result += jipyo[0]
        }
    }
    
    return result
}
