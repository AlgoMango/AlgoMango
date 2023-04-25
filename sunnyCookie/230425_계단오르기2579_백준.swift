// https://www.acmicpc.net/problem/2579

let lastStep: Int = Int(readLine()!)!
var points: [Int] = [0]

for _ in 0..<lastStep {
    points.append(Int(readLine()!)!)
}

func searchMaxPoint(_ n: Int) -> Int {
    if n == 1 {
        return points[1]
    } else if n == 2 {
        return points[1] + points[2]
    } else if n == 3 {
        return max(points[1] + points[3], points[2] + points[3])
    }

    var addedPoints = [0,
                       points[1],
                       max(points[1] + points[2], points[2]),
                       max(points[1] + points[3], points[2] + points[3])]

    for i in 4...n {
        let newAdded = max(points[i] + addedPoints[i-2], points[i] + points[i-1] + addedPoints[i-3])
        addedPoints.append(newAdded)
    }

    return addedPoints[n]
}

print(searchMaxPoint(lastStep))
