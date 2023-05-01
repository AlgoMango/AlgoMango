//https://www.acmicpc.net/problem/2217

func solution() {
    let count = Int(readLine()!)!
    var ropes: [Int] = []
    var max = 0
    
    for _ in 1...count {
        ropes.append(Int(readLine()!)!)
    }
    
    ropes = ropes.sorted(by: >) // 배열의 끝에 가장 약한 로프가 오게 정렬
    
    while !ropes.isEmpty { //가장 약한 로프를 기준으로 최대 중량을 확인해보는 방식
        let rope = ropes.removeLast()
        let weight = rope * (ropes.count + 1)
        
        if weight > max {
            max = weight
        }
    }
    
    print(max)
}

solution()
