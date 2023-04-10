//https://www.acmicpc.net/problem/2447

/*
재귀
탈출조건 : 3되면 패턴 프린트하고 탈출ㅂ
패턴에 ["  *  ", " * * ", "*****"] 넣고 시작

1. 재귀 탈떄마다 기존 산 양 옆에 스페이스 3번씩 추가하기! 한번만 추가하면 안 됌
   산의 갯수가 세로방향으로 갈수록 1개 -> 2개 -> 4개늘어나므로 pattern.count/3 번을 양 옆에 스페이스 3번 추가해줘야됌
2. 새로운 산들은 기존 산에 스페이스 한번 하고 똑같이 그리므로 map{ $0 + " " + $0 } 으로 그림
3. 1번 2번 합쳐서 다시 탈출할때까지 재귀돌리기
*/

let input = Int(readLine()!)!

func prtStar(n: Int, pattern: [String]) {
    if n == 3 {
        pattern.forEach { print($0) }
        return
    }

    let spacing = Array(repeating: "   ", count: pattern.count/3)
    let space = pattern.map { spacing.joined() + $0 + spacing.joined() }
    let newLine: [String] = pattern.map { $0 + " " + $0 }
    let newPattern = space + newLine

    prtStar(n: n/2, pattern: newPattern)
}

prtStar(n: input, pattern: ["  *  ", " * * ", "*****"])
