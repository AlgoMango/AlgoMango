import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var answer: Int = 0
    var idx: Int = 0
    var curWeight: Int = 0
    var bridge: [(weight: Int, time: Int)] = []
    var passed: Int = 0
    
    // 다리 길이 = 원소의 개수인 배열을 생성해서 할 수도 있을 것 같음
    // [0 0]
    // [0 7]
    // [7 0]
    // [0 4]
    
    while passed < truck_weights.count {
        for i in 0..<bridge.count { bridge[i].time += 1 }
        
        if !bridge.isEmpty && bridge.first!.time == bridge_length {
            curWeight -= bridge[0].weight
            bridge.removeFirst()
            passed += 1
        }
        
        if idx < truck_weights.count && weight >= curWeight + truck_weights[idx] && bridge_length > bridge.count {
            bridge.append((weight: truck_weights[idx], time: 0))
            curWeight += truck_weights[idx]
            idx += 1
        }
        answer += 1
    }
    
    return answer
}
