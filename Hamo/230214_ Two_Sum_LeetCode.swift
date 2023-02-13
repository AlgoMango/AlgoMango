class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = nums.count - 1
        
        var sortedNums = nums.sorted()
        
        while start < nums.count {
            var currentValue = sortedNums[start] + sortedNums[end]
            
            if currentValue > target {
                end -= 1
            } else if currentValue < target {
                start += 1
            } else {
                break
            }
        }
        
        let startIndex = Int(nums.firstIndex(of: sortedNums[start])!)
        let endIndex = Int(nums.lastIndex(of: sortedNums[end])!)
        
        return [startIndex, endIndex]
    }
}
