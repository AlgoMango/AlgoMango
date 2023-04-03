//230403_11729하노이탑이동순서_백준

/*
 봉은 3개
 출력 조건은 총 Count와 봉에 제일 위에 있는 원판들의 이동 경로
 왜 시간초과..
*/

// Input
let input = Int(readLine()!)!

func move(_ start: Int, _ end: Int, _ onePan: Int) {
    if onePan == 1 { // 제일 작은 원판
        print(start, end)
        return
    }
    
    move(start, 6 - start - end, onePan - 1)
    print(start, end)
    move(6 - start - end, end, onePan - 1)
}

// Output
// 2^input
print(1 << input - 1)

move(1, 3, input)
