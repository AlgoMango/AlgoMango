// https://leetcode.com/problems/maximum-subarray
// 합이 최대값을 갖는 subArray찾기
// 앞 배열자르기: 주어진 배열의 index를 돌면서  < 현재 인덱스에서의 값(ex: 3) > VS <currentTotal + 현재인덱스에서의값(ex: 3) > 중 큰값을 다시 currentTotal에 담는다
//             이렇게하면 그전까지 합이 음수이면, 앞에까지 더해진 값이 날라가고 새로운 현재인덱스의값(3) 이 담긴다.
// 뒤 배열자르기: 계속 index를 돌면서 currentTotal이 업데이트 될 때마다 maxTotal이라는 변수에 지금 < maxTotal에 담겨있는값 > VS < currentTotal > 중 큰 값을 담아놓는다
//             이렇게 하면 return을 MaxTotal로하게되면, 뒤 까지 더해지면서도 커지지 않는 값들은 알아서 잘리게된다.

func maxSubArray(_ nums: [Int]) -> Int {
   var currentTotal: Int = nums.first!
   var maxTotal: Int = nums.first!

   for index in 1..<nums.count {
       currentTotal = max(nums[index], nums[index] + currentTotal)
       maxTotal = max(currentTotal, maxTotal)
   }

   return maxTotal
}
