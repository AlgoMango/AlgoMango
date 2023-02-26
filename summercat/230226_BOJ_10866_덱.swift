var dequeue: [Int] = []

func push_front(_ num: Int) {
  var new: [Int] = [num]
  new.append(contentsOf: dequeue)
  dequeue = new
}

func push_back(_ num: Int) {
  dequeue.append(num)
}

func pop_front() {
  if dequeue.isEmpty { print(-1) }
  else { print(dequeue.removeFirst()) }
}

func pop_back() {
    if dequeue.isEmpty { print(-1) }
    else { print(dequeue.removeLast()) }
}

func size() {
  print(dequeue.count)
}

func empty() {
  if dequeue.isEmpty { print(1) }
  else { print(0) }
}

func front() {
  if dequeue.isEmpty { print(-1) }
  else { print(dequeue.first!) }
}

func back() {
  if dequeue.isEmpty { print(-1) }
  else { print(dequeue.last!) }
}

let cases = Int(readLine()!)!

for _ in 1...cases {
  let input = readLine()!.split(separator: " ").map { String($0) }
  
  if input.count == 1 {
    let command = input[0]
    if command == "size" { size() }
    else if command == "empty" { empty() }
    else if command == "front" { front() }
    else if command == "back" { back() }
    else if command == "pop_front" { pop_front() }
    else if command == "pop_back" { pop_back() }
  } else {
    let command = input[0]
    let num = Int(input[1])!
    if command == "push_front" { push_front(num) }
    else if command == "push_back" { push_back(num) }
  }
}
