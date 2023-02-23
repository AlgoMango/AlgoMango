// https://leetcode.com/problems/product-of-array-except-self/description/

func productExceptSelf(_ nums: [Int]) -> [Int] {
    guard nums != Array(repeating: 0, count: nums.count) else {
        return Array(repeating: 0, count: nums.count)
    }

    var answer: [Int] = []
    var multiplying: Int = nums.reduce(1, *)

    for (index, num) in nums.enumerated() {
        if num == 0 {                       // 나누기할 때는 분모에 0이 들어가는걸 막아야해서 분기를 탔음
            var numsArray = nums          
            numsArray.remove(at: index)
            let multi = numsArray.reduce(1, *)
            answer.append(multi)
        } else {
            answer.append(multiplying / num)
        }
    }

    return answer
}

/*
------------------------------------------------------------------------------------
*/

// 빠른결과값 1등 답지
// 왼쪽값에 본인을 곱한 Array가있고(result)
// 오른쪽부터 곱해지는 변수 rightProd 가 있으면
// index 2면 왼쪽부터 곱해진 Index 1값과 오른쪽부터 곱해진 rightProd를 곱해서 리턴

func productExceptSelf(_ nums: [Int]) -> [Int] {

    var result = Array(repeating: 0, count: nums.count)

    result[0] = 1
    for i in 1...nums.count - 1 {

        result[i] = nums[i - 1] * result[i - 1]
    }

    var rightProd = 1
    for i in (0...nums.count - 1).reversed() {

        result[i] = result[i] * rightProd
        rightProd *= nums[i]
    }
    return result
}
