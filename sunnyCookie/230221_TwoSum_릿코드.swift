// https://leetcode.com/problems/two-sum/submissions/902065497/

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var leftIndex: Int = 0
    var rightIndex: Int = nums.count - 1

    while true {

        while leftIndex < rightIndex {
            var addedNum = nums[leftIndex] + nums[rightIndex]

            if addedNum == target {
                return [leftIndex, rightIndex]
            } else {
                leftIndex += 1
            }
        }

        leftIndex = 0
        rightIndex -= 1
    }

    return [0, 0]
}

/*
------------------------------------------------------------------
*/

//제출 답지 중 가장 런타임이 짧은 예시
//인덱스를 두 개 두는게 아닌 target에서 첫번째 i값을 빼고 N = target - i, Index를 올리면서 N값을 찾도록 반복

class Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = 0
        var range = 1
        
        for numberA in 0..<nums.count {
            for numberB in range..<nums.count  {
                result =    nums[numberA] + nums[numberB]
                if result == target {
                   return [numberA ,numberB]
                }
            }
            range +=  1
           
        }
      
        return []
    }
}
