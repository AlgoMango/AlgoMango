// https://school.programmers.co.kr/learn/courses/30/lessons/43163

/*
문제이해
두 개의 단어 begin, target과 단어배열인 words가 주어질 때 begin -> target으로 변환하는 가장 짧은 변환 과정을 찾기
    규칙
    1. 한 번에 한 개의 알파벳만 바꿀 수 있다.
    2. words에 있는 단어로만 변환할 수 있다.

예) begin이 "hit", target가 "cog", words가 ["hot","dot","dog","lot","log","cog"]라면 
  "hit" -> "hot" -> "dot" -> "dog" -> "cog"
---------------------------------------------------------------------------------------------------
풀이
dfs사용 - 한글자만 다른 단어들을 stack에 담음 이때 몇번째 인지 +1씩 더해주는 count 값도 함께저장.
이 스택의 단어를 하나씩 꺼내면서 꺼낸 단어와 한글자만 다른 단어들을 count +1 해서 다시 스택에담음 -> 스택이 빌때까지 반복
tack에서 꺼낼때 target과 같으면 저장했던 count를 반환. 스택이 빌 때까지 다 돌아도 출력이 안되면 0출력
*/

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: words.count)
    var stack: [(word: String, count: Int)] = [(word: begin, count: 0)]

    while !stack.isEmpty {
        let stackLast = stack.removeLast()
        let (word2, count2) = (stackLast.word, stackLast.count) //  word2 = "hit", count = 0
        let currentWordArray: [Character] = Array(word2) // currentWordArray = ["h", "i", "t"]

        guard word2 != target else { // stack에서 꺼낸값이 같으면 count return
            return count2
        }

        // 주어진 words배열 중 한글자만 다른 단어 찾기
        for (wordsIdx, word) in words.enumerated() {
            guard !visited[wordsIdx] else { continue }

            var differentCount: Int = 0

            // 단어 한character들을 돌면서 다를때만 differentCount에 +1
            for (charIdx, char) in word.enumerated() {
                if currentWordArray[charIdx] != char {
                    differentCount += 1
                }
            }

            // 한글자만 다를경우 스택에 추가
            if differentCount == 1 {
                stack.append((word: word, count: count2 + 1))
                visited[wordsIdx] = true
            }
        }
    }

    return 0
}
