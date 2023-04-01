
// https://www.acmicpc.net/problem/2630
/*
 문제이해
 0(흰색), 1(파랑색) 이 섞인 색종이를 1/4 씩 자르면서 모두 잘린 조각내부가 모두 같은색이면 더 자르지않는다.
 1/4 조각내부 색이 다른게 섞이면 또 1/4 로 잘라서 색확인 >> 모두 같은색으로만 이루어질때까지 자른 후 각 색깔의 종이 갯수 출력
 ------------------------------------------------------------------------------------
 풀이
 재귀..
 놓친부분: 1/4로 자르기전에 처음부터 모두 같은색일때를 확인해야함.
 */

import Foundation

let n = Int(readLine()!)!
var paper: [[Int]] = []

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    paper.append(line)
}

var answer: [Int] = [0, 0]

let initialCheck = checkAllSame(piece: paper)

guard initialCheck.isSame == false else {
    answer[initialCheck.val!] += 1
    answer.forEach { print($0) }
    exit(0)
}

func cuttingQuarters(paper: [[Int]]) {
    let n: Int = paper.count
    let half: Int = n / 2
    let allZeroPaper = Array(repeating: Array(repeating: 0, count: half), count: half)
    var (first, second, third, fourth) = (allZeroPaper, allZeroPaper, allZeroPaper, allZeroPaper)

    for x in 0..<n {
        for y in 0..<n {
            if (0..<half) ~= x && (0..<half) ~= y {
                first[x][y] = paper[x][y]
            } else if (0..<half) ~= x && (half..<n) ~= y {
                second[x][y - half] = paper[x][y]
            } else if (half..<n) ~= x && (0..<half) ~= y{
                third[x - half][y] = paper[x][y]
            } else if (half..<n) ~= x && (half..<n) ~= y {
                fourth[x - half][y - half] = paper[x][y]
            }
        }
    }

    let firstResult = checkAllSame(piece: first)
    let secondResult = checkAllSame(piece: second)
    let thirdResult = checkAllSame(piece: third)
    let fourthResult = checkAllSame(piece: fourth)

    firstResult.isSame ? answer[firstResult.val!] += 1 : cuttingQuarters(paper: first)
    secondResult.isSame ? answer[secondResult.val!] += 1 : cuttingQuarters(paper: second)
    thirdResult.isSame ? answer[thirdResult.val!] += 1 : cuttingQuarters(paper: third)
    fourthResult.isSame ? answer[fourthResult.val!] += 1 : cuttingQuarters(paper: fourth)
}

func checkAllSame(piece: [[Int]]) -> (isSame: Bool, val: Int?) {
    let filteredValues: [Int] = [0, 1].filter { $0 != piece[0][0] }
    let otherValue = filteredValues[0]

    for values in piece {
        if values.contains(otherValue) {
            return (false, nil)
        }
    }
    return (true, piece[0][0])
}

cuttingQuarters(paper: paper)
answer.forEach { print($0) }
