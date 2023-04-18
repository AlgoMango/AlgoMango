struct Point {
    var x: Int
    var y: Int
}

let n = Int(readLine()!)!
var points: [Point] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let point = Point(x: input[0], y: input[1])
    points.append(point)
}

func merge(_ leftArr: [Point], _ rightArr: [Point]) -> [Point] {
  var left = 0
  var right = 0
  var temp = [Point]()
  
  while left < leftArr.count && right < rightArr.count {
    if leftArr[left].x < rightArr[right].x {
      temp.append(leftArr[left])
      left += 1
    }
    else if leftArr[left].x > rightArr[right].x {
      temp.append(rightArr[right])
      right += 1
    }
    else {
      if leftArr[left].y < rightArr[right].y {
        temp.append(leftArr[left])
        left += 1
      } else {
        temp.append(rightArr[right])
        right += 1
      }
    }
  }
  
  temp += leftArr[left..<leftArr.count]
  temp += rightArr[right..<rightArr.count]
  
  return temp
}

func mergeSort(_ arr: [Point]) -> [Point] {
  if arr.count < 2 { return arr }
  
  let mid = arr.count / 2
  let leftArr: [Point] = Array(arr[0..<mid])
  let rightArr: [Point] = Array(arr[mid..<arr.count])
  
  return merge(mergeSort(leftArr), mergeSort(rightArr))
}

let sorted = mergeSort(points)
sorted.forEach { print("\($0.x) \($0.y)") }
