import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let recordsCopy = records.map { $0.split(separator: " ") }.sorted { $0[1] < $1 [1] }
    var entryExitTimes: [String: [String]] = [:]
    var parkingTimes: [String: Int] = [:]
    var results: [Int] = []
    Array(Set(recordsCopy.map { $0[1] })).forEach { entryExitTimes[String($0)] = [] }
    recordsCopy.forEach {
        entryExitTimes[String($0[1])]?.append(String($0[0]))
        parkingTimes[String($0[1])] = 0
    }
    
    for (key, value) in entryExitTimes.sorted(by: { $0.key < $1.key }) {
        if value.count % 2 != 0 {
            parkingTimes[key]! += calculateTime(inTime: value.last!, outTime: "23:59")
        }
        
        for index in 0..<value.count {
            if index % 2 != 0  {
                parkingTimes[key]! += calculateTime(inTime: value[index - 1], outTime: value[index])
            }
        }
        
        results.append(calculateFee(fees: fees, parkingTimes: parkingTimes[key]!))
    }
    
    return results
}

func calculateTime(inTime: String, outTime: String) -> Int {
    let inTimeCopy = inTime.split(separator: ":").map { Int($0)! }
    let outTimeCopy = outTime.split(separator: ":").map { Int($0)! }
    
    return (outTimeCopy[0] * 60 + outTimeCopy[1]) - (inTimeCopy[0] * 60 + inTimeCopy[1])
}


func calculateFee(fees: [Int], parkingTimes: Int) -> Int {
    let baseTime = fees[0]
    let baseFee = fees[1]
    let unitTime = fees[2]
    let unitFee = fees[3]
    
    if parkingTimes < baseTime {
        return baseFee
    }
    
    return baseFee + Int(ceil((Double(parkingTimes - baseTime) / Double(unitTime)))) * unitFee
}
