//https://www.acmicpc.net/problem/10799

/*

() 일때는 레이저고, (())는 막대기 안의 레이저이므로 index로 '('가 들어왔을 때, 다음이 ')'인지 확인해 레이저인지 확인하는 분기를 탐
레이저가 아닌 '(' 이면 배열에 막대기를 추가하기위해 sticks 1을 담음.
레이저를 만나면 배열에 담긴 막대기들이 모두 나눠지면서 한 덩이씩(?) 더 생기는 거므로 배열의 모든 막대기갯수가 +1 하는것과 똑같은데, 배열을 돌며 +1 해주는건 시간초과가나서
answer에 바로 배열의 count를 담아줬다.

( )( ( ( ( ) ( ) ) ( ( ) ) ( ) ) ) ( ( ) )
 ⚡️ ( ( (  ⚡️   ⚡️  ) (  ⚡️  )  ⚡️  ) ) (  ⚡️  ) 

 ⚡️                                         sticks = []          answer = 0
 ⚡️ (                                       sticks = [1]         answer = 0
 ⚡️ ( ( (                                   sticks = [1, 1, 1]   answer = 0
 ⚡️ ( ( (  ⚡️                                sticks = [2, 2, 2]   answer = 0                      
 ⚡️ ( ( (  ⚡️   ⚡️                            sticks = [3, 3, 3]   answer = 0
 ⚡️ ( ( (  ⚡️   ⚡️  )                         sticks = [3, 3]      answer = 3
 ⚡️ ( ( (  ⚡️   ⚡️  ) (                       sticks = [3, 3, 1]   answer = 3
 ⚡️ ( ( (  ⚡️   ⚡️  ) (  ⚡️                    sticks = [4, 4, 2]   answer = 3
 ⚡️ ( ( (  ⚡️   ⚡️  ) (  ⚡️  )                 sticks = [4, 4]      answer = 3 + 2
 ⚡️ ( ( (  ⚡️   ⚡️  ) (  ⚡️  )  ⚡️              sticks = [5, 5]      answer = 3 + 2
 ⚡️ ( ( (  ⚡️   ⚡️  ) (  ⚡️  )  ⚡️  )           sticks = [5]         answer = 3 + 2 + 5
 ⚡️ ( ( (  ⚡️   ⚡️  ) (  ⚡️  )  ⚡️  ) )         sticks = []          answer = 3 + 2 + 5 + 5
 ⚡️ ( ( (  ⚡️   ⚡️  ) (  ⚡️  )  ⚡️  ) ) (       sticks = [1]         answer = 3 + 2 + 5 + 5
 ⚡️ ( ( (  ⚡️   ⚡️  ) (  ⚡️  )  ⚡️  ) ) (  ⚡️    sticks = [2]         answer = 3 + 2 + 5 + 5
 ⚡️ ( ( (  ⚡️   ⚡️  ) (  ⚡️  )  ⚡️  ) ) (  ⚡️  ) sticks = []          answer = 3 + 2 + 5 + 5 + 2 

여기서 배열을 전부 돌면서 +1씩 해주는게 비효율적이라 answer에 바로 sticks.count를 더해주고, 배열들의 값은 1을 유지해야 시간초과가 안남. 
*/
var brackets: [Character] = Array(readLine()!)
var sticks: [Int] = []
var index: Int = 0
var answer: Int = 0

while index < brackets.count {
    switch brackets[index] {
    case ")":
        answer += sticks.removeLast()
        index += 1
    default: 
        if brackets[index + 1] == ")" {
            answer += sticks.count
            index += 2
        } else {
            sticks.append(1)
            index += 1
        }
    }
}

answer += sticks.reduce(0, +)
print(answer)


/*
-----------------------------------------------------
*/

// 위와똑같, 배열에 1,1,1,1,1 이렇게만 담기므로 막대기 배의 갯수를 stickCount 변수로 놓고 푼다. -> 16ms 똑같

var brackets: [Character] = Array(readLine()!)
var stickCount: Int = 0
var index: Int = 0
var answer: Int = 0

while index < brackets.count {
    switch brackets[index] {
    case ")":
        stickCount -= 1
        index += 1
    default:
        if brackets[index + 1] == ")" {
            answer += stickCount
            index += 2
        } else {
            answer += 1
            stickCount += 1
            index += 1
        }
    }
}

answer += stickCount
print(answer)
