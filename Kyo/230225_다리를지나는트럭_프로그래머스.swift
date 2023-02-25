//230225_다리를지나는트럭_프로그래머스
import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var trucks = truck_weights
    var bridgeWeight = Array(repeating: 0, count: bridge_length)
    
    var totalWeight = 0
    var cnt = 0
    
    while !bridgeWeight.isEmpty {
        totalWeight -= bridgeWeight.removeFirst()
        cnt += 1
        if !trucks.isEmpty {
            if totalWeight + trucks.first! <= weight {
                let newWeight = trucks.removeFirst()
                totalWeight += newWeight
                bridgeWeight.append(newWeight)
            } else {
                bridgeWeight.append(0)
            }
        }
    }
    return cnt
}
