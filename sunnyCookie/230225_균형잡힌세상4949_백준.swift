// https://www.acmicpc.net/problem/4949

while true {
    let sentence: String = readLine()!
    let pair: [Character: Character] = [")": "(", "]": "["]
    var stack: [Character] = []

    guard sentence != "." else {
        break
    }

    for character in sentence {
        if character == "(" || character == "[" {
            stack.append(character)
        } else if character == ")" || character == "]" {
            guard let stackLast = stack.last,
                  stackLast == pair[character] else {
                print("no")
                break
            }

            stack.removeLast()
        } else if character == "." {
            stack.isEmpty ?  print("yes") : print("no")
        }
    }
}
