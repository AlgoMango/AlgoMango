//230218_TwoSum_LeetCode
// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var temp = nums.sorted(by: <)
        var result: [Int] = []
        var left = 0
        var right = nums.count - 1

        while left < right {
            if temp[left] + temp[right] < target {
                left += 1
            } 

            if temp[left] + temp[right] > target {
                right -= 1
            }

            if temp[left] + temp[right] == target {
                result.append(nums.firstIndex(of: temp[left])!)
                result.append(nums.lastIndex(of: temp[right])!)
                break
            }
        }

        return result
    }
}
