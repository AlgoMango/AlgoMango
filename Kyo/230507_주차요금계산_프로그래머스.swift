//230507_주차요금계산_프로그래머스

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var defaultTime = fees[0]
    var defaultFee = fees[1]
    var timePer = fees[2]
    var feePer = fees[3]
    
    var dict: [String:Int] = [:]
    var carNumbers: [String] = []
    
    for index in 0..<records.count {
        var flag = false
        var temp = records[index].split(separator: " ").map { String($0) }
        if temp[2] == "OUT" { continue }
        
        var carNumber = temp[1]
        
        if index < records.count - 1 {
            for index2 in index + 1..<records.count {
                var temp2 = records[index2].split(separator: " ").map { String($0) }
                if carNumber == temp2[1] {
                    dict[carNumber] = (dict[carNumber] ?? 0) + calculator(temp[0], temp2[0])
                    flag = true
                    break
                }
            }
        }
        
        if !flag { dict[carNumber] = (dict[carNumber] ?? 0) + calculator(temp[0], "23:59") }
    }
    
    
    for key in dict.keys {
        carNumbers.append(key)
        var time = dict[key]!
        if time <= defaultTime {
            dict[key] = defaultFee
            continue
        }
        
        if (Double(time - defaultTime) / Double(timePer)) != Double((time - defaultTime) / timePer) {
            dict[key] = defaultFee + (((time - defaultTime) / timePer) + 1) * feePer    
        } else {
            dict[key] = defaultFee + ((time - defaultTime) / timePer) * feePer
        }
    }
    
    carNumbers.sort(by: <)
    
    var answer: [Int] = []
    for car in carNumbers {
        answer.append(dict[car]!)
    }
    
    return answer
}

func calculator(_ timeA: String, _ timeB: String) -> Int {
    var timesA: [Int] = timeA.split(separator: ":").map { Int($0)! }
    var timesB: [Int] = timeB.split(separator: ":").map { Int($0)! }
    
    return (timesB[0] * 60 + timesB[1]) - (timesA[0] * 60 + timesA[1])
}
