// https://www.acmicpc.net/problem/2504

/*
입력값의 한괄호씩 돌면서
열린괄호들 '(, [' 은 stack에 담는다.
열리고닫힌 쌍 '(), []'이 나오면 2, 3으로 변환 후 스택에 담겨 값들 '( = 2, [ = 3'을 곱해서 values 배열에 담는다.
닫힌괄호들 '), ]' 이 나오면 스택의 마지막 값이 짝꿍괄호 ')의짝꿍 = (, ]의짝꿍 = ['인지 확인한 후 스택에서 제거한다ㅁ
마지막에 values에 담긴 모든 값들을 더해서 프린트한다. (이 때 스택이 비어있어야한다!! 반례: '((()' )  

( ( ) [ [ ] ] ) ( [ ] )
(  2  [  3  ] ) (  3  )

(                        스택: ["("]        values: []
(  2                     스택: ["("]        values: [ 2x2, ] //스택에 담겨있는 '(' = 2를 곱해서 담는다.
(  2  [                  스택: ["(", "["]   values: [ 2x2, ]
(  2  [  3               스택: ["(", "["]   values: [ 2x2, 2x3x3 ]
(  2  [  3  ]            스택: ["(" ]       values: [ 2x2, 2x3x3 ] // 닫힌괄호가 나오면 스택에서 마지막값을 삭제한다
(  2  [  3  ] )          스택: []           values: [ 2x2, 2x3x3 ]
(  2  [  3  ] ) (        스택: ["("]        values: [ 2x2, 2x3x3 ]
(  2  [  3  ] ) (  3     스택: ["("]        values: [ 2x2, 2x3x3, 2x3] 
(  2  [  3  ] ) (  3  )  스택: []           values: [ 2x2, 2x3x3, 2x3] 
                                                   -> = ( 4 + 18 + 6 ) = 28 // 스택이 빈것을 확인하고, values를 다 더한값을 print해준다 
*/
import Foundation

let brackets: [Character] = Array(readLine()!)
let pair: [Character: (pairBracket: Character, value: Int)] = [")": ("(", 2),
                                                               "(": (")", 2),
                                                               "]": ("[", 3),
                                                               "[": ("]", 3)]
var stack: [Character] = []
var values: [Int] = []
var index: Int = 0

while index < brackets.count {
    let bracket: Character =  brackets[index]

    if bracket == "(" || bracket == "[" {
            stack.append(bracket)
            index += 1
    } else if bracket == ")" || bracket == "]" {
        guard index != 0 else {
            print(0)
            exit(0)
        }

        if brackets[index - 1] == pair[bracket]!.pairBracket { 
            var value = pair[bracket]!.value
            stack.removeLast()
            stack.forEach { value = value * pair[$0]!.value }
            values.append(value)
        } else {
            guard let stackLast = stack.last else {
                print(0)
                exit(0)
            }

            if stackLast == pair[bracket]?.pairBracket {
                stack.removeLast()
            } else {
                print(0)
                exit(0)
            }
        }

        index += 1
    } else {
        print(0)
        exit(0)
    }
}

stack.isEmpty ? print(values.reduce(0, +)) : print(0)
