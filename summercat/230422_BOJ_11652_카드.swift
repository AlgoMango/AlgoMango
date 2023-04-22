let n = Int(readLine()!)!
var cards: [Int: Int] = [:]
var maxCount: Int = 0
var maxCard: Int = 100001

for _ in 0..<n {
  let number = Int(readLine()!)!
  cards[number, default: 0] += 1
}

for (card, cardCount) in cards {
  if cardCount == maxCount { maxCard = card < maxCard ? card : maxCard }
  else if cardCount > maxCount {
    maxCount = cardCount
    maxCard = card
  }
}

print(maxCard)
