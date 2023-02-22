// 이번에 짠 코드
import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridgeLeft: [Int] = Array(repeating: 0, count: bridge_length)
    var bridgeRight: [Int] = []
    var trucks: [Int] = truck_weights.reversed()
    var trash: [Int] = []
    var currentWeight = 0
    var time = 0
    
    while !(bridgeLeft + bridgeRight).isEmpty  {
        if bridgeLeft.isEmpty {
            bridgeLeft = bridgeRight.reversed()
            bridgeRight.removeAll()
        }
        
        let temp = bridgeLeft.popLast()!
        
        if temp != 0 {
            trash.append(temp)
            currentWeight -= temp
        }
        
        if !trucks.isEmpty && (currentWeight + trucks.last!) <= weight {
            let currentTruck = trucks.removeLast()
            bridgeRight.append(currentTruck)
            currentWeight += currentTruck
        } else if !trucks.isEmpty {
            bridgeRight.append(0)
        }
        
        time += 1
    }
    
    return time
}

// 옛날에 짠 코드
func solution1(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {

    var answer: Int = 0
    var truckArray = truck_weights
    var nowWeight: Int = 0
    var bridgeArray = Array(repeating: 0, count: bridge_length)

    while !bridgeArray.isEmpty {
        answer += 1

        nowWeight -= bridgeArray.removeFirst()

        if let truck = truckArray.first {
            if nowWeight + truck <= weight {
                bridgeArray.append(truck)
                nowWeight += truckArray.removeFirst()
            } else {
                bridgeArray.append(0)
            }
        }
    }

    return answer
}

