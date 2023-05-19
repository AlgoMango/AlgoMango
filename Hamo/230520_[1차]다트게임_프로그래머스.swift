import Foundation

func star(nums: [Int]) -> [Int] {
    var temp = nums
    let target1 = temp.removeLast()
    
    if nums.count > 1 {
        let target2 = temp.removeLast()
        temp.append(target2 * 2)
    }
    
    temp.append(target1 * 2)
    return temp
}

func pow(_ target: Int, _ power: Int) -> Int {
    var temp = target
    
    guard power > 1 else {
        return target
    }
    
    for _ in 1...power - 1 {
        temp *= target
    }
    
    return temp
}

func solution(_ dartResult: String) -> Int {
    var nums: [Int] = dartResult
        .components(separatedBy: ["S", "D", "T", "*", "#"])
        .filter { $0 != ""}
        .map { Int($0)! }
        .reversed()
    
    let characters: [Character] = dartResult.map { $0 }.filter { !$0.isNumber }
    let area: [String: Int] = ["S": 1, "D": 2, "T": 3]
    
    var results: [Int] = []
    
    for element in characters {
        if area.contains(where: { $0.key == String(element) }) {
            results.append(nums.removeLast())
            let temp = results.removeLast()
            let power = area[String(element)]!
            results.append(pow(temp, power))

        } else if element == "*" {
            results = star(nums: results)
            
        } else {
            let temp = results.removeLast()
            results.append(temp * -1)

        }
    }
    
    return results.reduce(0, +)
}
