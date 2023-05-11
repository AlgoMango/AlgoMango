//230511_개인정보 수집 유효기간_프로그래머스
import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var answer: [Int] = []
    var tDict: [String:Int] = [:]
    
    for index in 0..<terms.count {
        var data = terms[index].split(separator: " ").map { String($0) }
        tDict[data[0]] = Int(data[1])!
    }
    
    var todayValue = Int(today.split(separator: ".").map { String($0) }.joined())!
    
    for index in 0..<privacies.count {
        var data = privacies[index].split(separator: " ").map { String($0) }
        
        var dateArray = data[0].split(separator: ".").map { String($0) }

        var newDateArray: [String] = ["", "", ""] 
        
        var tempMonth = Int(dateArray[1])! + tDict[data[1]]!
        var addYear = 0 
        
        if tempMonth > 12 {
            if tempMonth % 12 == 0 {
                addYear = tempMonth / 12 - 1
                tempMonth = 12
            } else {
                addYear = tempMonth / 12 
                tempMonth = tempMonth % 12
            }
        }
        
        newDateArray[0] = String(Int(dateArray[0])! + addYear) // 년 추가
        newDateArray[1] = String(tempMonth)                    // 월
        newDateArray[2] = String(Int(dateArray[2])! - 1)       // 일
        
        if newDateArray[2] == "0" { // 0일이면 월 감소
            newDateArray[1] = String(tempMonth - 1)
            newDateArray[2] = "28"
        }
        
        if Int(newDateArray[1])! < 10 { // 10월 밑이면 "0"붙이기
            newDateArray[1] = "0" + newDateArray[1]
        }
        
        if Int(newDateArray[2])! < 10 { // 10일 밑이면 "0" 붙이기
            newDateArray[2] = "0" + newDateArray[2]
        }
        
        if todayValue > Int(newDateArray.joined())! {
            answer.append(index + 1)
        }
        print(newDateArray.joined())
    }
    
    return answer
}
