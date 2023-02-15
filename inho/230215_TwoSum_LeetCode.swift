// O(n) 시간복잡도, 투포인터

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let sortedNumbers = nums.sorted()
        var start = 0, end = nums.count - 1
        var result = [0,0]
        
        while start < end {
            let currentNumber = sortedNumbers[start] + sortedNumbers[end]
                
            if currentNumber == target {
                start = nums.firstIndex(of: sortedNumbers[start])!
                end = nums.lastIndex(of: sortedNumbers[end])!
                
                result = [start, end]
                
                break
            } else if currentNumber < target {
                start += 1
            } else {
                end -= 1
            }
        }
        
        return result
    }
}
