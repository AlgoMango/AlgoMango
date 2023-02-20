func solution() {
    var cards = Array(1...Int(readLine()!)!)
    var index = 0
    
    guard cards.count > 1 else {
        print(1)
        return
    }
    
    while true { 
        cards[index] = 0 // 카드를 없애는 대신 0으로 대체하여 오버헤드 줄이기
        cards.append(cards[index + 1])
        cards[index + 1] = 0
        index += 2
        
        if cards[cards.count - 2] == 0 { //filter 대신 index로 접근하여 시간단축
            break
        }
    }
    
    print(cards.last!)
}

solution() //썸캣천재?
