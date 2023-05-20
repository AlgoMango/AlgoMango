import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var firstMap: [[Int]] = []
    var secondMap: [[Int]] = []
    var results: [String] = []

    for index in 0..<n {
        var temp1 = String(arr1[index], radix: 2)
        var temp2 = String(arr2[index], radix: 2)

        temp1 = String(repeating: "0", count: n - temp1.count) + temp1
        temp2 = String(repeating: "0", count: n - temp2.count) + temp2

        firstMap.append(temp1.map { Int(String($0))! })
        secondMap.append(temp2.map { Int(String($0))! })
    }

    for row in 0..<n {
        var temp = ""
        for (first, second) in zip(firstMap[row], secondMap[row]) {
            if first == 0 && second == 0 {
                temp += " "
            } else {
                temp += "#"
            }
        }

        results.append(temp)
    }

    return results
}
