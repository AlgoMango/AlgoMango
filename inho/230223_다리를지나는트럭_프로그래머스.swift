func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    var stack: [Int] = Array(repeating: 0, count: bridge_length)
    var bridgeWeight = 0
    var result = 0
    
    while !stack.isEmpty {
        result += 1
        bridgeWeight -= stack.removeFirst()
        
        if let truck = trucks.first {
            if truck + bridgeWeight <= weight {
                stack.append(trucks.removeFirst())
                bridgeWeight += truck
            } else {
                stack.append(0)
            }
        }
    }
    
    return result
}
