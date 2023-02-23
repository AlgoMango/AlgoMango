// https://leetcode.com/problems/maximum-product-subarray/
// 서브어레이중 곱셈값이 가장 큰 값구하기
// [3, -1, 4, -2]를 생각해보면 음수가 짝수번 나오면 다 곱하는게 큰값이되니까 min값(-값)도 비교해야하고, 
// [3, -1, 4]를 생각해보면 앞에서 곱하더라도 4가 젤 큰값으로 리턴되야해서 value도 비교해야한다.
// 그래서 index를 돌면서 변수에 maxCurrent, minCurrent 를 계속 업데이트해야하는데 그 때 비교해야하는 값들이 
// let values = [value * maxCurrent, value * minCurrent, value] 인 => (1)현재인덱스에 담긴 값에 max곱한거, (2)현재인덱스에 담긴 값에 min곱한거, (3)현재인덱스에 담긴 값을 비교해야한다. 

func maxProduct(_ nums: [Int]) -> Int {
    var maxValue: Int = nums.first!
    var maxCurrent: Int = maxValue
    var minCurrent: Int = maxValue

    for index in 1..<nums.count {
        let value = nums[index]
        let values = [value * maxCurrent, value * minCurrent, value]

        maxCurrent = values.max()!
        minCurrent = values.min()!
        maxValue = max(maxValue, maxCurrent)
    }

    return maxValue
}
