// https://leetcode.com/problems/container-with-most-water/description/

/*
문제이해
  기둥 높이를 Int배열로 주어졌을 때, 두 기둥 사이에 채울 수 있는 물의 양 max를 리턴하는 함수 만들기
    ex) [1,8,6,2,5,4,8,3,7] 라면 8과 7 사이에 물의양 = 높이 7 * 간격 7 = 49 를 리턴한다

풀이
  처음엔 O(N^2)으로 풀고 시간초과나서, 답지봄. 
  투포인터 사용, 높이가 왼쪽 기둥이 오른쪽 기둥보다 낮으면 왼쪽 index를 +1 하고, 반대면 오른쪽 index를 -1한다.
  인덱스가 바뀔때마다 max()를 이용해서 answer를 업데이트해준다
*/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left: Int = 0
        var right: Int = height.count - 1
        var answer: Int = 0

        while left < right {
            answer = max(answer, min(height[left], height[right]) * (right - left))

            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }

        return answer
    }
}
