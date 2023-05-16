//https://school.programmers.co.kr/learn/courses/30/lessons/17682

func solution(_ dartResult:String) -> Int {
    var points: [Int] = []
    var isTen = false
    
    for result in dartResult {
        switch result {
        case "S":
            continue
        case "D":
            let point = points.removeLast()
            points.append(point * point)
        case "T":
            let point = points.removeLast()
            points.append(point * point * point)
        case "*":
            let last = points.removeLast()
            if !points.isEmpty {
                let preLast = points.removeLast()
                points.append(preLast * 2)
            }
            
            points.append(last * 2)
        case "#":
            let point = points.removeLast()
            points.append(-point)
        default:
            let point = Int(String(result))!
            
            if point == 1 {
                isTen = true
            } else if point == 0, isTen {
                points.removeLast()
                points.append(10)
                isTen = false
                continue
            } else {
                isTen = false
            }
            points.append(point)
        }
    }
    
    return points.reduce(0, +)
}
