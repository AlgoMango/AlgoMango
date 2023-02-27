// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/

/*
문제이해
    배열 [a[0], a[1], a[2], ..., a[n-1]] 가 주어지면
    1번 회전하면 -> [a[n-1], a[0], a[1], a[2], ..., a[n-2]] 이된다.
        ex) [0,1,2,4,5,6,7] -> 4times -> [4,5,6,7,0,1,2]
    배열은 주어질 때부터 오름차순으로 sorting되어있고, 요소들은 중복이없다. O(log n) 으로
-------------------------------------------------------------------------
 풀이
    min() 메서드 사용

다른 풀이
    배열이 sorted 되어있으므로 left, right, mid index로 접근

*/

import Foundation

func findMin(_ nums: [Int]) -> Int {
    return nums.min()!
}

//-----------------------------------------------------------------------
// (근데.. 시간 똑같이 걸림)

func findMin(_ nums: [Int]) -> Int {
    var minNum: Int = nums[0]
    var left: Int = 0
    var right: Int = nums.count - 1
    var mid: Int { return (left + right) / 2 }

    while left <= right {
        if nums[left] < nums[right] {
            return min(minNum, nums[left])
        }

        minNum = min(nums[mid], minNum)

        if nums[mid] >= nums[left] {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return minNum
}
