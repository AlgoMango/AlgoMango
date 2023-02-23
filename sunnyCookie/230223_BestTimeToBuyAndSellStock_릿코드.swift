// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/

// 주어진 배열을 돌면서, 최소값이 바뀌면 업데이트(minValue), 더 큰 판매가격이 나오면 업데이트(maxValue) 해준 후 마지막에 있는 maxValue를 리턴한다.
// min(Int, Int) 와 max(Int, Int)를 사용

func maxProfit(_ prices: [Int]) -> Int {
    var minValue: Int = Int.max
    var maxValue: Int = 0

    for price in prices {
        minValue = min(price, minValue)
        maxValue = max(maxValue, price - minValue)
    }

    return maxValue
}
