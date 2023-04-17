struct Letter {
  var value: String
  var isVowel: Bool
}

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let size = input[0]
let c = input[1]
var characters = readLine()!.split(separator: " ").map { String($0) }.sorted()
// 알파벳 순서대로 모음 여부를 가지고 담긴 배열
var letters: [Letter] = []
//
for char in characters {
  switch char {
  case "a", "e", "i", "o", "u":
    letters.append(Letter(value: char, isVowel: true))
  default:
    letters.append(Letter(value: char, isVowel: false))
  }
}

// 최소 하나의 모음, 최소 두개의 자음
func recur(_ word: [Letter], _ idx: Int, _ vCount: Int, _ cCount: Int) {
  if word.count == size {
    if vCount > 0 && cCount > 1 {
      let password = word.map { $0.value }.joined()
      print(password)
    }
    return
  }
  
  for i in idx..<letters.count {
    if letters[i].isVowel {
      recur(word + [letters[i]], i + 1, vCount + 1, cCount)
    }
    else {
      recur(word + [letters[i]], i + 1, vCount, cCount + 1)
    }
  }
}

recur([], 0, 0, 0)
