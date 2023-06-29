// 20분 + 쉬고 이틀뒤 + 20분

// 입력을 받은 후 x축 좌표순으로 정렬
// (뒤에서부터 채우면) 한번 내려갈 경우, 그 다음에 자신보다 높은 애가 나와서는 안 된다.

let count = Int(readLine()!)!
var map: [Int] = Array(repeating: 0, count: 1_001)
var pillars: [(idx: Int, height: Int)] = []
var maxHeight: Int = 0
var maxIndices: [Int] = []
var answer: Int = 0

for _ in 0..<count {
  let pillar = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
  pillars.append((pillar[0], pillar[1]))
  if pillar[1] > maxHeight {
    maxHeight = pillar[1]
    maxIndices = [pillar[0]]
  } else if pillar[1] == maxHeight {
    maxIndices.append(pillar[0])
  }
}

pillars.sort { $0.idx < $1.idx }
maxIndices.sort { $0 < $1 }

func solve() {
  var left: Int = 0
  var right: Int = pillars.count - 1
  
  if maxIndices.count == 1 {
    // 왼쪽
    if pillars[0].height != maxHeight {
      var start = pillars[0].idx
      var height = pillars[0].height
      
      while true {
        left += 1
        if pillars[left].height > height {
          answer += (pillars[left].idx - start) * height
          start = pillars[left].idx
          height = pillars[left].height
        }
        if pillars[left].height == maxHeight { break }
      }
    }
    
    // max
    answer += maxHeight
    
    // 오른쪽
    if pillars[pillars.count - 1].height != maxHeight {
      var end = pillars[pillars.count - 1].idx
      var height = pillars[pillars.count - 1].height
      
      while true {
        right -= 1
        if pillars[right].height > height {
          answer += (end - pillars[right].idx) * height
          end = pillars[right].idx
          height = pillars[right].height
        }
        if pillars[right].height == maxHeight { break }
      }
    }
  } else {
    // 왼쪽
    if pillars[0].height != maxHeight {
      var start = pillars[0].idx
      var height = pillars[0].height
      
      while true {
        left += 1
        if pillars[left].height > height {
          answer += (pillars[left].idx - start) * height
          start = pillars[left].idx
          height = pillars[left].height
        }
        if pillars[left].height == maxHeight { break }
      }
    }
    
    // max구간
    answer += maxHeight * (maxIndices.last! - maxIndices.first! + 1)
    
    // 오른쪽
    if pillars[pillars.count - 1].height != maxHeight {
      var end = pillars[pillars.count - 1].idx
      var height = pillars[pillars.count - 1].height
      
      while true {
        right -= 1
        if pillars[right].height > height {
          answer += (end - pillars[right].idx) * height
          end = pillars[right].idx
          height = pillars[right].height
        }
        if pillars[right].height == maxHeight { break }
      }
    }
  }
}

solve()
print(answer)
