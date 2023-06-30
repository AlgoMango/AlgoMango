//230630_임스와함께하는미니게임25757_백준
// Y 게임 2명 필요,
// F 게임 3명 필요,
// O 게임 4명 필요

// For문 한방 돌리면 될듯.

let input = readLine()!.split(separator: " ").map { String($0) }
let total = Int(input[0])!
let game = input[1] == "Y" ? 1 : (input[1] == "F" ? 2 : 3)

var distinctPeople: Set<String> = []

for _ in 0..<total {
    distinctPeople.insert(readLine()!)
}

print(distinctPeople.count / game)
