//230511_달리기경주_프로그래머스
import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    var rankingDict: [String:Int] = [:]
    
    var players = players
    for index in 0..<players.count {
        rankingDict[players[index]] = index
    }
    
    for call in callings {
        var index = rankingDict[call]!  // 불린 선수의 랭킹
        
        var temp = players[index - 1]
        players[index] = temp
        players[index - 1] = call
        
        rankingDict[call] = index - 1
        rankingDict[temp] = index
    }
    
    return players
}
