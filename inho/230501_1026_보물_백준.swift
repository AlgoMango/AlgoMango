//acmicpc.net/problem/1026
//박살난 가독성,, 죄송합니다,,,ㅎ

func solution() {
    let count = Int(readLine()!)!
    let firstArray = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted(by: >)
    let secondArray = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()
    
    print(zip(firstArray, secondArray).map({ $0 * $1 }).reduce(0, +)) // 두배열을 각각 오름차순,내림차순 정렬해서 곱해버리기 (큰 수가 작은수 만나도록)
}

solution()
