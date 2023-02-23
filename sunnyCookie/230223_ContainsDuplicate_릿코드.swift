// https://leetcode.com/problems/contains-duplicate/description

// Set에 Array를 바로 담아 줄 수 있음.

func containsDuplicate(_ nums: [Int]) -> Bool {
    return Set(nums).count != nums.count
}
