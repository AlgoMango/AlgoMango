// https://www.acmicpc.net/problem/1992

/*
문제이해
영상이 bit로 이중배열로 주어짐,(0은 흰색, 1은 검정색을 나카냄)
모두 0이면 "0"출력, 모두 1이면 "1"을 출력한다.
0과 1이 섞여 있으면 전체를 한 번에 나타내지를 못하고, 십자가로 4영역으로 나누어 압축한다.
4개의 영역을 압축한 결과를 차례대로 괄호 안에 묶어서 출력한다

풀이
재귀..
 */


let n = Int(readLine()!)!
var video: [[Int]] = []

for _ in 0..<n {
    video.append(readLine()!.map { Int(String($0))! })
}

var answer: [String] = []

func sol(_ x: Int, _ y: Int, _ size: Int) {
    if size == 1 {
        answer.append(String(video[x][y]))
        return
    }

    for i in 0..<size {
        for j in 0..<size {
            if video[x+i][y+j] != video[x][y] {
                answer.append("(")
                let half = size/2
                sol(x, y, half)
                sol(x, y+half, half)
                sol(x+half, y, half)
                sol(x+half, y+half, half)
                answer.append(")")
                return
            }
        }
    }
    answer.append(String(video[x][y]))
}

print(answer.joined())
