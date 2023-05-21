import Foundation

func findIntersection(_ A: [String], _ B: [String]) -> [String] {
    var intersection: [String] = []
    let sortedA = A.sorted()
    let sortedB = B.sorted()
    
    func recursive(_ indexA: Int, _ indexB: Int) {
        if indexA == sortedA.count || indexB == sortedB.count {
            return
        }
        
        if sortedA[indexA] == sortedB[indexB] {
            intersection.append(sortedA[indexA])
            recursive(indexA + 1, indexB + 1)
        } else if sortedA[indexA] > sortedB[indexB] {
            recursive(indexA, indexB + 1)
        } else {
            recursive(indexA + 1, indexB)
        }
    }
    
    recursive(0, 0)
    return intersection
}


func solution(_ str1:String, _ str2:String) -> Int {
    let str1Array: [String] = str1.map { String($0) }
    let str2Array: [String] = str2.map { String($0) }
    
    var str1Combinations: [String] = []
    var str2Combinations: [String] = []
    
    var intersection: [String] = []
    var union: [String] = []
    
    for index in 1..<str1Array.count {
        let tempStr = str1Array[index - 1] + str1Array[index]
        
        if tempStr.allSatisfy({ $0.isLetter }) {
            str1Combinations.append(tempStr.uppercased())
        }
    }
    
    for index in 1..<str2Array.count {
        let tempStr = str2Array[index - 1] + str2Array[index]
        
        if tempStr.allSatisfy({ $0.isLetter }) {
            str2Combinations.append(tempStr.uppercased())
        }
    }
    
    if str1Combinations.isEmpty && str2Combinations.isEmpty {
        return 65536
    }
    
    intersection = findIntersection(str1Combinations, str2Combinations)
    union = str1Combinations + str2Combinations
    
    intersection.forEach {
        let index = union.firstIndex(of: $0)
        union.remove(at: index!)
    }
    
    let J = Double(intersection.count) / Double(union.count) * 65536
    
    return Int(J)
}
