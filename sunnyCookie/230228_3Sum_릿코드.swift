// https://leetcode.com/problems/3sum/

/*
문제이해
    nums가 숫자 배열일 때 (똑같은 숫자 있을 수 있고, 정렬되어있지 않음)
    그 중 세개의 숫자 합이 0 인 값들 ex( [-1, 0, 1] ) 들을 모아서 리턴해주는데, 이 때 중복된 값은 제거한다. 
        ex) [[-1, 0, 1], [-1, 0, 1]]라면 [[-1, 0, 1]]로 하나만 출력

*/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let orderedNums = nums.sorted() // 오름차순으로 만든 뒤 index를 이용해 탐색예정
        var standard: Int = 0
        var left: Int = 0
        var right: Int = 0
        var answer: Set<[Int]> = []   // 중복값 제거를 위해 Set을 사용한다

        while standard < nums.count - 2 {
            guard orderedNums[standard] <= 0 else { // 음수중복값 제거를 위해 Set을 사용한다
                break
            }

            left = standard + 1
            right = nums.count - 1

            while left < right {
                let searching: Int = 0 - orderedNums[standard]
                
                if orderedNums[left] + orderedNums[right] == searching {
                    answer.insert([orderedNums[standard], orderedNums[left], orderedNums[right]])
                    left += 1
                    right -= 1
                } else if orderedNums[left] + orderedNums[right] > searching {
                    right -= 1
                } else if orderedNums[left] + orderedNums[right] < searching {
                    left += 1
                }
            }

            standard += 1
        }

        return Array(answer)
    }
}
