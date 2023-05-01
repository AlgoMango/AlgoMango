//https://www.acmicpc.net/problem/11399
//박살난 가독성 22,,, 죄송합니다,,

func solution() {
    let count = Int(readLine()!)!
    let times = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()
    var result = 0

    (0..<count).forEach { result += times[0...$0].reduce(0, +) } //오름차순으로 정렬하고 누적값 계산하
    
    print(result)
}

solution()
