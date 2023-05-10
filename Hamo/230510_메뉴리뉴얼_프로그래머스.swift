import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result: [String] = []
    for courseCount in course {
        var courseCombination: [String: Int] = [:]
        
        orders
            .filter { $0.count >= courseCount }
            .forEach {
                makeCourse(count: courseCount, target: $0)
                    .forEach {
                        let key = $0.sorted(by: <).map { String($0) }.joined()
                        if courseCombination[key] == nil {
                            courseCombination[key] = 1
                        } else {
                            courseCombination[key]! += 1
                        }
                    }
            }
        
        var max = 0
        for (key, value) in courseCombination.sorted(by: { $0.value > $1.value }) {
            if value >= max && value > 1 {
                max = value
                result.append(key)
            }
        }
    }
    
    return result.sorted(by: <)
}

func makeCourse(count: Int, target: String) -> [String] {
    var temp: [String: [String]] = [:]
    var combinations: [String] = []
    
    if target.count == 0 {
        return []
    }
    
    for (index, key) in zip(0..<target.count, target) {
        var targetArr: [String] = target.map { String($0) }.reversed()
        
        (0...index).forEach { _ in targetArr.popLast() }
        temp[String(key)] = targetArr
    }
    
    func dfs(current: Int, menu: String) {
        if current == count {
            combinations.append(menu)
            return
        }
        
        for element in temp[String(menu.last!)]! {
            dfs(current: current + 1, menu: menu + element)
        }
    }
    
    for element in target {
        dfs(current: 1, menu: String(element))
    }
    
    return combinations
}
