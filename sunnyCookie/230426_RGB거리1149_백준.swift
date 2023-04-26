// https://www.acmicpc.net/problem/1149

let n: Int = Int(readLine()!)!
var rgb: [[Int]] = [[0, 0, 0]]

for _ in 1...n {
    rgb.append(readLine()!.split(separator: " ").map { Int(String($0))!})
}

func findMin() -> Int {
    var costs: [[Int]] = [[0, 0, 0], rgb[1]]

    for i in 2...n {
        let r = min(rgb[i][0] + costs[i-1][1], rgb[i][0] + costs[i-1][2])
        let g = min(rgb[i][1] + costs[i-1][0], rgb[i][1] + costs[i-1][2])
        let b = min(rgb[i][2] + costs[i-1][0], rgb[i][2] + costs[i-1][1])
        costs.append([r, g, b])
    }


    return costs[n].min()!
}

print(findMin())
