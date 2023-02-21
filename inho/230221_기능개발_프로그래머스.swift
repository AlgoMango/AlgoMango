func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var stack: [Int] = []
    var result: [Int] = []
    var release = 0
    //출시일로 이루어진 스택
    for (progress, speed) in zip(progresses, speeds) { 
        stack.append(Int(ceil(Double(100 - progress) / Double(speed))))
    }
    //차례대로  출시일과 비교
    for item in stack {
        if release < item {
            release = item
            result.append(1)
        } else {
            result[result.count - 1] += 1
        }
    }
    
    return result
}
